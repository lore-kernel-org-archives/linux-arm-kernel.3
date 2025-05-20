Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF93DC54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKcs6b0AA5ZZBJLb1JtJdqM/QeWUh0JfrB8WikrPpnA=; b=XevUFNcxvScUuSttiVmKo91Afn
	z5D43cT74P/6cS473wBU5I0UiuWPhQH7j21rQ0pO445eMd+q9NVdSDBgK5dI58LTs/mhe4zGpMSSm
	60uNogu7HFYhsrMUeYwTp4Gl8ye7HSJdlHgsgZC3y3Bw8Dbh3FEt/s+sJnDJVxU6ylAiArLYuOUhP
	R6QsUqi21B2aEDt+jDaM/AUuFs/fwi/y7hXxeWlpI+VBIddoYRVS3LFVYszUxCVm2yR3WLYG0+lxt
	lKOpKwRa5cIOVJioJlLJYYfAgDveqUSVEl4d2h9VNtPiexIbzp3/fhOykvB2/WIx/XMdPPOqIieiR
	K49lPkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD6z-0000000BNTq-2Dmf;
	Tue, 20 May 2025 02:53:49 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2N-0000000BMjE-46lJ;
	Tue, 20 May 2025 02:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709272;
	bh=IKcs6b0AA5ZZBJLb1JtJdqM/QeWUh0JfrB8WikrPpnA=;
	h=From:To:Subject:Date:Message-Id;
	b=A0vd+xL8L7JF4hzQE9GwoXpQMtaZao+VO1zYQ4KQ0HXzVMxHhL/jVGH6vxTdmAQ5T
	 6zqOCO/2CoUWCYedzgRnA1g148BgNA69VLBhbVhc6o0bkEzrnfAXRxVbKmpzwLjeZa
	 MHT3i5gW1Xh79QNruABEm5KwOk+/b9wJU8+F6868=
X-QQ-mid: zesmtpgz1t1747709270tfc1b7ec2
X-QQ-Originating-IP: KB9lR9nSthPiIc+Nf/1GP2Tikw3ty9gNZQUC/A0vEPg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2345042519657141149
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 20 May 2025 10:47:16 +0800
Message-Id: <20250520024718.142-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Nzm/ywkHpQhPfwad78O6VrRfoMxmCXDgc4pun7aRlmNTCKXYubt18I50
	mIsktJo2Wn4RbOu8TZDygphtItM50VvVOhy2tNy+YO+cKe3bNBndUV1FgQh19IIV2up6409
	jZm/O5+TSxMWuY8IeaibeTzNfs2mTIFdDg2IYHwuCuynNu4Dl1+wTk8+CGwucb/DIwdKiuV
	2t/xpar56UlZTRptOf2ah8ui3Uh5+Xl9iKnWA58NNVdp7j/Dq1GHr/rOAtCtCwBzuZrhOQo
	agCuku8Xt0rVvV9R70QMqVBhlFjpSpn05NE5asgFTipiHwywb2ADF2VzMpTC3FDY0hTtZox
	ZFkZpRVf781+P7DeqNRjC4AUOskAVKItbrCMjPzcz93gf6HF8PG+KSgvka5zIGea8537kvr
	pqcV9GLtJM3zg2RwUcuLkmLOGARDq4dAwW0jmv56DDoIrnUy2vin+M0VEhoOFmf2l4QtsoQ
	VLvR+6J8NftXCsD9k7r0JsDy4SdsIaQZWwR7EmAjBmg316JpNIWel4mEc4nTi7iKOi1Bs9u
	YReANYw8UbvlZMsiv9hbWrGg0agqrQ/ExxM6CS9EFHdy8brHT6fxVix81Wnhmd6T8STaVt/
	j6PcV4dBE1x3W4k6RqN7MI5x9EszLJ0FMEFTQ2v8FhCitM7wr+MriWVunYWcziPNJZOalwI
	iBO/vvW25UlFvKrXmy9Cnyr2HAKJEKEv7q9h6raW/Zf50M9bnlZRb0TdFqM6KfDYB8dBgIW
	YwJKLsu6RJGANRyYPhOCoirJD3UO60lzehN5It4IVBqrt2hmHGzqvHjIkDiugIXV8uHnhEG
	mxsf5uYQ2a8YT4kJ8gEg3UxXGS/OfiLZAWpYLrb9J2Vhioqa01q9bKf6Y7+PEbvP/C4Scnx
	UULaJvEwgxLCsqL9fNzRz5JmCvDqu49TADmRbxyJnfTopCt8njJ6qOYWMJAizvE8kx0mlbX
	Dm4RPh7rqf0Zy7QxBOp/gsS0kerdOESEH+6lTIDBvYqE+8It1R7aOG/KQ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_194904_640706_B69D0CD5 
X-CRM114-Status: GOOD (  11.54  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml. It changed the
constraints for the phys and extcon properties.

Both of them add new port@1 node that represents the CDN DP output to
keep the same style as the other display interfaces.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250519012632.94-1-kernel@airkyi.com/
- Fix constraints on extcon and phys
- Add commit about changes to extcon and phys
- Add "#sound-dai-cells" to required properties

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250513011904.102-1-kernel@airkyi.com/
- Add commit about port@1 node

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 168 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 177 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0



