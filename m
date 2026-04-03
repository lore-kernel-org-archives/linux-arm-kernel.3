Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF57D7308A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 03:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdPOlbAUIqljmWFhodWwJuCVc9GTRBRfx9bHmiMi4Xc=; b=h25s9+u3dXOMRno8Y9KN1rr/ba
	j76Lr0kkDwLjmU/TuUL8YVz1uOjYLBPuLWqAUJDWOWuadAZNftwst73Amvk4k4feRUAIBDQRBQPTP
	Hd288Rvrk2FDoZwGARYQW7jricUhWbq1S+dGI2kNDeF/Fr2B1EALgxU0hrqaSytJcVkJwmb8jVBsB
	uszzwYuR5pDJpwp49gfpw0pFfyZ89lbXdHqCMlBijo0YJzkhwVFA/ppe4JQ0fF9ip8fX4M/5tS6Rm
	w02sIlah3POaf+HIWqdJSAYKGqNKB3odLtjgyE+Eo2rh+Gdc4NY437DB+XFGJr9RLlz7Ol28FXlPp
	N9PGT1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VHX-000000018mf-0aBs;
	Fri, 03 Apr 2026 03:33:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8VHU-000000018lt-3sak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 03:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775187190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vdPOlbAUIqljmWFhodWwJuCVc9GTRBRfx9bHmiMi4Xc=;
	b=EQiXE3ENx6eNHaSSwTvQfz8ihZHUP7Gc0fMlyf2+k+2SxKOUsxRVsXTj2Nfjy2ezwjKImL
	ozPCAKbH2EvP4pW3vJpXhv0amj9fB5OvMIS4KxuYf4bZ6VxhoEjrwhV8gYlBsVdpHvMY0o
	QVp0UP0644EY7MHPNsRDDxCcmvVMaQY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-r2Cs3SuTOJ29usbMGP78Yg-1; Thu,
 02 Apr 2026 23:33:06 -0400
X-MC-Unique: r2Cs3SuTOJ29usbMGP78Yg-1
X-Mimecast-MFC-AGG-ID: r2Cs3SuTOJ29usbMGP78Yg_1775187186
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 660291956089;
	Fri,  3 Apr 2026 03:33:05 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C15961800673;
	Fri,  3 Apr 2026 03:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc6,
 upstream-arm-next, 129fdb45)
Date: Fri, 03 Apr 2026 03:33:03 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <77552.126040223330700258@us-mta-606.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9KCr0j8Zt4KwUCuOG1oq5-YPQxx7jj73OQPoRbgTsYk_1775187186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_203313_040995_E18233BA 
X-CRM114-Status: UNSURE (   6.17  )
X-CRM114-Notice: Please train this message.
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

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge remote-tracking branch 'origin/nocache-cleanup' i=
nto for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2427004144


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


