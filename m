Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A34C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uzyvgt04u1kLkT1LFwnspb0gvdIF1hD2E62ElmLvHps=; b=D/v5MKLCT2AxUq2gs4aBa36dpe
	L/9B2US3wNKet1Ab/5PebsvLy7pw7lhg8v8972xVHw9NJ3JQOrDaYwpR0f062BQ/q26338+XupS7z
	CxfN1jfakgvzjoAk+BezZ5gXweDhEj2PWD7o7bgUZGYKPiD4eLQXlP+uQnfXxA/dshqXpncGeHbuk
	uNai2dXv7gzkhCY5By8T/jmBsvrzV13KoxDn9bSUuZ7NEb+hbn50nSSHIsvBaUTIfD/i1unb9IQux
	peeYiPpOCjz2tRyn/uAfHkjEDvGKqH/XuRVOdwLZtB1Rw6GkzMAF2OrNvW6/+d9KFszMrISQSCe/e
	HQiohSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3Gb-0000000HKp8-1WfB;
	Mon, 28 Sep 2026 04:47:05 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3GY-0000000HKol-3daE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 04:47:04 +0000
DKIM-Signature: a=rsa-sha256; b=SVe90heEUMeEQiCYFeD21+8zfCcJs+Hq3d7m0LJh58mI41bAzvYAnu5ED08arlQ4lUkYqXlHPqotXc3aOQlrgCr6Sb0Y0/hD+zUDgB4nKLGQyBRYWC7bcmu1a73rOWZKAYiwppIfbMFC2gzeypWM3OyRIBmhXZwxQYpdylUuVQ77U1CDx1eb0EJgy3EVdHkdKMcOLh72I4HaXYe7avD5/irsei6VOtOWU4/KSXDUB0mYwv/Z3Em3HFSZGcwxha+k/8AFnmurKUZg6qfHT/Mw2KrVUQkudgxW/H31Qv4IyYMC9KSCmaXizAtoHdgxcx0shQab0q62Oa+ftLGZW1tJgg==; s=purelymail3; d=q-lab.dev; v=1; bh=y2oX2C+1PWcvUePRLeVC2WrEQwNq744I2qXkHAN8bUE=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=7cYgAZI+3O6mjlhAIlfYtlnyYlqkeGLdO8dHWuAGcI6w2GAgkFO1EyRgnIj5jTmAhOULWqSjH9/1OTkTDrhohTnqWdzZ/JA5A9c6ozcdgye0N/aA70I3MECk/TgWHzMPU++t1Ujs4uV5s1DufwLpuNuMftlM4Df1XRi/F+WmAy+WHtv9o+kToomqAm8m9WUcBibNbhGwSMeYjh4eF/f0QQarJw1lM0bEUoipEGp34fV6zQFqE4oi7KnAkyN3H9PzYaBrwMaFnQSmTL53N7Gr3jdM7Tmywqfc8SY405MmEHwvEcrh0v2GUyhxrj5LTbzOTYro9qrPGcVw/f8urTWXjg==; s=purelymail3; d=purelymail.com; v=1; bh=y2oX2C+1PWcvUePRLeVC2WrEQwNq744I2qXkHAN8bUE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1853740651;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 28 Sep 2026 04:46:35 +0000 (UTC)
From: Quentin Freimanis <quentin@q-lab.dev>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Richard Cochran <richardcochran@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: sparx5: skip ptp deinit if init was skipped
Date: Sun, 27 Sep 2026 21:45:42 -0700
Message-ID: <20260928044542.29287-1-quentin@q-lab.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_214703_008855_47F2C1DA 
X-CRM114-Status: GOOD (  10.44  )
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

sparx5_ptp_init() returns early on the base lan969x variants
because they do not have the SPX5_FEATURE_PTP flag. It also returns early
when no "ptp" interrupt is described. Unbinding the driver then causes a
NULL pointer dereference when cleaning up uninitialized tx_skbs queues:

    Unable to handle kernel NULL pointer dereference at virtual address
    0000000000000008
    Call trace:
    skb_queue_purge_reason+0x68/0x120 (P)
    sparx5_ptp_deinit+0x64/0xc0
    mchp_sparx5_remove+0x38/0x70
    platform_remove+0x20/0x30
    device_remove+0x4c/0x80

Before per-port tx_skbs were added, a NULL dereference would have happened
when calling ptp_clock_unregister() on the never-registered PTP clocks.

Fix by returning early in sparx5_ptp_deinit() if PTP is not used.

Fixes: 0933bd04047c ("net: sparx5: Add support for ptp clocks")
Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/n=
et/ethernet/microchip/sparx5/sparx5_ptp.c
index a16ec8136d6d..5953e04ef14e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -673,6 +673,9 @@ void sparx5_ptp_deinit(struct sparx5 *sparx5)
 =09struct sparx5_port *port;
 =09int i;
=20
+=09if (!sparx5->ptp)
+=09=09return;
+
 =09if (sparx5->ptp_irq >=3D 0) {
 =09=09disable_irq(sparx5->ptp_irq);
 =09=09sparx5->ptp_irq =3D -ENXIO;
--=20
2.55.0


