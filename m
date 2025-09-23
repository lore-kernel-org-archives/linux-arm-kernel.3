Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A5CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4jUpXLsZEzhN5gdqyk2XnkNOz6aiPTxrRsZKrxphp9U=; b=4SF1X3iOYf8tborI5ItExLKyiZ
	J+jrJ1TFaRRVC/h6mZiAxtPaLQuWDgE/s24MDZBOtMFaJLt5vT+KHZN0cWwN5pseMVtTqbK1iQWG5
	k9uWaYTYqRFzcEgFtIuSygIjV58yX8TjpL4QshHG8y4wSwulm2O9Qxc70EoJsD+2TNzGW1ho89hhy
	21Wisup7Lf6dSaayUHbo1467R0SyEq9UwLSViPAgH4RDxOZvetemcO/CyGoL7l2Ma53uAjT+SA6gH
	fOoq1wVSO25ZF4+jgrft6Nc7OxZ1YSHBxWiAUns4Fgn7OlUNi824IhvRLt8gmudYUry2lksIu11yg
	mwUUck5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ulp-0000000CLQ6-0YbQ;
	Tue, 23 Sep 2025 04:36:53 +0000
Received: from www3141.sakura.ne.jp ([49.212.207.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ull-0000000CLNu-2nqc;
	Tue, 23 Sep 2025 04:36:51 +0000
Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58N4aNN0016609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 23 Sep 2025 13:36:23 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id CC745109F2883;
	Tue, 23 Sep 2025 13:36:22 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOh9L4ODFgNc; Tue, 23 Sep 2025 13:36:19 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 40990109F2880; Tue, 23 Sep 2025 13:36:19 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758602179;
	cv=none; b=n4MR4BFzG131PEG7Ii1qN6ZqugPa1V9Ts3sawdaBeVgDSxDiqLnSWDSuJWockjfVx8CbZTSrwd78fHF4tht/hy6rwhGtBugISd57OKbobhhEOnRmV4EGEjf+hwPVzHIuvIa3dw6On3oCpDEbzP+KmzKxFw0L9N5Xr4gsi9l2wAw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1758602179; c=relaxed/relaxed;
	bh=4jUpXLsZEzhN5gdqyk2XnkNOz6aiPTxrRsZKrxphp9U=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=IAi5lMDVPrK3NvBa7LfhFkEvng7GYk7gK+dTHquqnST5l2ngfAMzSg7ePJnbx7HejSdwMJkeeAp5s32YoSNR8fP3PqSva7cMa9D7C8EFgBFVNFhWnrZvOIoXrrZNZ2CsbAh/Omlz6LWLfo5u8wmjMMQ6bjqArKdvrNvlsrP58HI=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 40990109F2880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1758602179;
	bh=4jUpXLsZEzhN5gdqyk2XnkNOz6aiPTxrRsZKrxphp9U=;
	h=From:To:Cc:Subject:Date:From;
	b=ekGGZHVCEOVLGzvfSe4vNeRbhPS8YS/YQn6R9YiTn/ML0uT3wUBpml4XjwXTHltIz
	 t6S/syNS2zoExvTaeVyCHhPPJjcKAthMiXYsBXvq7WYnTn3PF/KcDbmMiA8IiAR2WW
	 HE3ShBQ6glsxQmfY3+DzHhCPFp+0LCvmXF5NiCRc=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: gregkh@linuxfoundation.org
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        umang.jain@ideasonboard.com, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] staging: vc04_services: mmal-vchiq: fix typo in comment
Date: Tue, 23 Sep 2025 13:36:17 +0900
Message-ID: <20250923043617.2482243-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_213649_921816_A3F684E4 
X-CRM114-Status: GOOD (  13.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

servie =E2=86=92 service

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/driver=
s/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 3fe482bd2793..c2b5a37915f2 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -326,7 +326,7 @@ static int bulk_receive(struct vchiq_mmal_instance *ins=
tance,
 		 * committed a buffer_to_host operation to the mmal
 		 * port without the buffer to back it up (underflow
 		 * handling) and there is no obvious way to deal with
-		 * this - how is the mmal servie going to react when
+		 * this - how is the mmal service going to react when
 		 * we fail to do the xfer and reschedule a buffer when
 		 * it arrives? perhaps a starved flag to indicate a
 		 * waiting bulk receive?
--=20
2.47.3


