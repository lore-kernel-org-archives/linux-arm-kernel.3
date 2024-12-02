Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E26D7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibzrOEjWbR+1FpvncmKtT0ZNKhHCYtX65cHqDPNlL+Q=; b=ouYHgXAGJT7opedvhsDE45N//I
	Le/o2hA6m2quQeudZ1DVn9Wr6WW/dfMCsWA9rf5r7SA3aEQlu74faw0mDzACcIVaioOGjLjSYkhm4
	7n7e2psLZd+haPi2AKZCGeqNK9s+rj5lFI5gAuV6bz+1IvkNEktCfny7Po+uIZfhdmAvM9fUsT5do
	zXDkjedswptHB487S5PuCepaENfd6LOBiwss8OFsCmJ+r/WBZFxUGQC0ZL6dRtJm/kPc41ZjJwPq/
	p5CSlpnAkDDORtqK856InW2sfI2wt/uutNTyMWeeo8y9hTZMpLZyDhFEpGi991U88r5qxnWHNWIHo
	hDThuOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4zE-00000005xuV-2x1h;
	Mon, 02 Dec 2024 11:53:08 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4xw-00000005xiX-0gGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733140303; x=1733745103; i=wahrenst@gmx.net;
	bh=ibzrOEjWbR+1FpvncmKtT0ZNKhHCYtX65cHqDPNlL+Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E8OL+bxdmisiKII6du+EsnYaVhY78A0iiu0dF/PcWG9SJzQyQqCARHeAav1QXKYW
	 LAIynIUTPRWTGLINv8t9S2/BA7vt4htvSWxr4jo+NS8isDFeBjxttS4XIYNm6preq
	 b2/qDW/Vjd3oOZqap6kwvUxe+y9jV7pVjy8v39mQMlfwR+cKr6TGvBlP+LLiNEx6l
	 8yN2AL78RApCRb/WmrDrA425DcsniGDm5+hhGHrwrST9MgzN18FP+808koTb4lwVE
	 armC5k90R0tzf/xvmuPdVXTOxTK3ggYhoEKbEBOO8fIRYz8Y+9sP6xejyReLKfPIr
	 HYEqurJm9Hm67S433w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeQr-1tE2M026pH-00O3QS; Mon, 02
 Dec 2024 12:51:43 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mmc@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V6] mmc: bcm2835: add suspend/resume pm support
Date: Mon,  2 Dec 2024 12:51:40 +0100
Message-Id: <20241202115140.33492-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qy0iQs7trXhPSa/VJ9TwZ80XuXPrbDjWDrphpG4soUTPmb7RRlb
 6Rs1Rmr+6YQPIptsORrb/fbszZv1PShC+M/L53DHnmX9nlksFN3AjCYI3jEwJB8OKWQV57+
 ODm/4cLAizujnRt5dk6snflV5JEVDfDDb7YzhOlzPY8xpmWfW6SpXicJjAIC3PwNZL7EPGB
 s0W0ZEpr7trBXv8CCON6g==
UI-OutboundReport: notjunk:1;M01:P0:kRPqPoA5QW4=;+h2fKxCFNIpKxPPv/AVwU8nW6jo
 tWxkZopz0nLWeJvonCVCaZtVJmjwa5SVmxRbPuoqcBYtokVaItC6IlzsO5EwIVPI1lXdGFEN6
 jRwEmXUxwW8worEyxMLhZvARJzyInbVvPOSt+TR83vz0Znq4AbBf/Br0Yw6dbM/i2W+QFVLQ1
 zJi9yGDDwSqTbnhRvb1GhKLI760oOu0z89qeclGo1kbK4E/B4IWUPa+DLmpYs89aQWvc2pyNh
 otGS3h6qqRrq7CnO6u1A6mxsG5tDjMLX4brqyJJ7bJY5agUUyfPFySI3TK7RBUXkwmokPjKDJ
 nWH9IiwC34JCz8w0PO77ZTtrD/5wBCgU8uo5XYCB2qn2SiTFwF6e2Kk0kOTmEjvfIdW58VDt4
 tHIqs22ZrPxjjsUHwQucNJFgB6LyYLmstDAD5GDv9q/JGW+gTEKqfHSqOXWeK6O2jlLN2uMYa
 q4NrWee8W3LTPCCLXGL0pG9rcPdYveoZxJGsDkFF8IF5mB3uke0wL3Qw8yPDQ7XPdo3uQLYxH
 D2quHcufNhpwF7zc2ylB4v4/Y1ACjO6jn+mRTUoyBdMeQ0zL5oVQNsDB+mqj7SpdEq4Yy+oA9
 kjRPpNmS+BMvyr1DlG3BFnrcF2kaNcOGiBL6ypMsAmuLhlEQralfyvF0kPGEd7ffpeC8W8iSS
 CXam/IEa6/hyb8ux+Qtd0swp3XobF+fZ/yXEfGLJL5yFpi5XE4TkeGABqWbpb9Zx/cj4C2mSi
 lOu0QvTL6PF8xebLdtCgNuV3ukDpzfCNgQ8sM3CCGiZcZUY6kUopjmcj+21A8WfJjtZrcptC2
 /Tgt9RGKBRe0Jbc1zylx4Dlorifu78Z7mpD380fcY6xGueTx/HknbFosvOzgqWabrujC4iVgJ
 vJBTw0ucQGPZzzRf+zpCxGSPwoNueYS1Jj2O1XB5XGLrChRD5jmbHjIYHoBrZFDeLYu9FOHAu
 tEL6J6U/Ae0G8t+/j0X8b3WeZqwWtOe+mmE9NjxYe9PhiyXQqheghhcHcR0tpJZKKO2S9QaFm
 7FJ0+fNorXF+nOYiSIVfnjjhchWWwQGyHL0yewPnSS4ZfRG5WKk03k3/uhF1V2fgOvP1kjPhp
 9YvhuwJZaEeZdw0Tx8TD0yFQdXHN88
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035148_481550_D132C465 
X-CRM114-Status: UNSURE (   9.72  )
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

Add a minimalistic suspend/resume PM support.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/host/bcm2835.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

Changes in V6:
- split out of series because there is no dependency
- remove unnecessary complete check

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 7847f0c8b465..e5f151d092cd 100644
=2D-- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1343,6 +1343,25 @@ static int bcm2835_add_host(struct bcm2835_host *ho=
st)
 	return 0;
 }

+static int bcm2835_suspend(struct device *dev)
+{
+	struct bcm2835_host *host =3D dev_get_drvdata(dev);
+
+	clk_disable_unprepare(host->clk);
+
+	return 0;
+}
+
+static int bcm2835_resume(struct device *dev)
+{
+	struct bcm2835_host *host =3D dev_get_drvdata(dev);
+
+	return clk_prepare_enable(host->clk);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(bcm2835_pm_ops, bcm2835_suspend,
+				bcm2835_resume);
+
 static int bcm2835_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -1471,6 +1490,7 @@ static struct platform_driver bcm2835_driver =3D {
 		.name		=3D "sdhost-bcm2835",
 		.probe_type	=3D PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	=3D bcm2835_match,
+		.pm =3D pm_ptr(&bcm2835_pm_ops),
 	},
 };
 module_platform_driver(bcm2835_driver);
=2D-
2.34.1


