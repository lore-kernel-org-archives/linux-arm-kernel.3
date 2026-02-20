Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75BC56202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9BF+iKLiPBk0pH8uiye4+X3nMfM0DDHEbLdx9fkM5NY=; b=Uz7yjT4NmnHywzT8qNeRkgkah8
	tCmgi0ib/m7HUGtsFPxr5QECo18C4hSgEM9THFjU3n9o69V411zoiZD9tWGC/OTLaGGC/wH3uuzM8
	k021EjQyobLg56/jGi1b12exC++Zwxw0MWySdObFtWVvjPyUW17snjjsUyb87hByBGcaSlJF+7KdI
	KY+baoS6Fpym6vnekIGyqm/AooNh9riWC3nZLGG82/WcDgGYU2UDkFzc4MhM3LauilybjYSo1InUN
	vFS6TZDbckk0LWFHQqK0hSg6CRENUwSXUDZERz5tn7tEehZC4mEQKWuJh1t9zM10qWvxggVnsS1M1
	r8+4gxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX9-0000000Eoje-1Md3;
	Fri, 20 Feb 2026 14:31:07 +0000
Received: from mx-relay159-hz1.antispameurope.com ([94.100.133.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX2-0000000Eoew-1D3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:01 +0000
ARC-Authentication-Results: i=1; mx-gate159-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9BF+iKLiPBk0pH8uiye4+X3nMfM0DDHEbLdx9fkM5NY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597848;
 b=SlrvoRaSsZo8KkmBOZPQJqZsZwcO1RWzcWN8Snv+tFeISoti46Ysvs8LKuioHsknKr/HpTlM
 G7ue8vLeOITVwED1vFz3ZznDJOnq4rWCt+/aB2flqiF+WNMqlhtsAl7YhvUWXlUELux6xtE9yT0
 eSRJjlKrlrsTEtWjqiRYX0zgAkG2pi4Nid2Sea1tbGULNMW2jtUPnReaCiySNZXw7zf+bBexC7n
 cTEt4+F6iC0NOmkwhRDoDUi4t0qo5Fj3MUQ2wyifJkc/gPTLeVj/VkeQ6LpVhZaMDi4R95s9bUm
 StFU+W/uN2OB3rFQ8w0GF1nYVOj0K8ywwotBGCjL8UjSg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597848;
 b=Bt4jvopDRrhspq+EY+wO0lRh2eK1APKT1ZNwOwYV7MAFkpOIfSecF5oOJ9dVB2HEo0iX8Lk0
 9W8s7rvmTSLDoKnAx19txqgMx5wcihC2xHOXm3Ny20KGHVJZuS6O2rrMOImOhBLqRo0M3Q5WOB4
 yhzxWa5RPYdNxt3t4PNNwPNu6g+lLhcZ+kmmUvaCKse5WJAJIIfo9ubNHuqF/BTZt7bwUzwPWSt
 eAtqLJCpIHZcaNbzQq3zryYcZmgIg6ZTXNbztmOv30htrQucTMwcrEjJjUYgSPIGsqM2Bzjc9mk
 4iXe44ZtuiDF3ydxvn4hEeZgZzKiESQxwMVkSB+tXEJiA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay159-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:30:47 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D59BDA412E2;
	Fri, 20 Feb 2026 15:30:27 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:30:01 +0100
Message-ID: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay159-hz1.antispameurope.com with 4fHXj04cDXzgpvg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: e5556c3a48687fcf828e2b64ea7fecbf
X-cloud-security: scantime:2.331
DKIM-Signature: a=rsa-sha256;
 bh=9BF+iKLiPBk0pH8uiye4+X3nMfM0DDHEbLdx9fkM5NY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597846; v=1;
 b=aT/euekZBe8Mu1odX1zy2nMszhy0/wmpE2dvwuKkrKUyY3fRpMB0CRQpxo9WCiygvXNlaHkf
 kBC0TmQMQjTM+P2KeMjVxMy+DDRyO7fJncI3vZHuVYKKfI7TA7lTDXbDFcte8sDQSGWsaNIJkX0
 fs32fG/s329hARo/vgu//TvJq49bStB1mws9rbR96TI3NLRXKKXqavMhSbq98pilf9ajccf9lMq
 aHZHmnh6f4Demn/1QBESmgmWBB04vgbNjla3cyZkTAinREdMhAuqegtIQSLi1AeQqKsb2iyrHYF
 fUn1hp66m0pLZkhWlvsA08fh4KMfn+aWQAhBcQW6j+8Vg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063100_482248_2AD4D321 
X-CRM114-Status: UNSURE (   9.59  )
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

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Changes in v2:
Improved commit messages for commits that add boot-phase properties.

Max Merchel (4):
  ARM: dts: imx6qdl-tqma6: add missing labels
  ARM: dts: imx6qdl: add boot phase properties
  ARM: dts: imx6qdl-tqma6: add boot phase properties
  ARM: dts: imx6qdl-mba6: add boot phase properties

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.43.0


