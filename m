Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC3C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=; b=JqSKGcoiHIDwjqWcdZgAldFswG
	KciJn+DCAjOgUKQgeGbcSSqrcA/qq2FV9X3G2/+ehScn1YwlycPEfTOhqGFnjX59O5bOr8k5cCTAn
	7rLzRPwfRVP4WhY3tqZr3m3N61G57m8kkFUk3jZqTTgkO70wbMXD92SsY1oj/5s+VVqUXmfP+LpiS
	kgHOL7eTZE+e+ZIPlGx6mEB7bb2z40uSTqKq1vFltD8xNvKBBNdN6pg9yxEWqZ9TAxDuSMw7AqSGI
	DEdlEwb3dvlJ0crUrDOENk7rV2pExSk6ufM0Yi4SOXNLT/nbXNRLsi/EuHFMPymdarQQn0uuXF6Mj
	eNRdWUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzj-00000000jWw-07C0;
	Tue, 25 Aug 2026 12:11:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzf-00000000jWH-2M5J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:11:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso6716846a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659865; x=1788264665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=Gq4D0Vq3xCPRWQhIuncTFJdIK6w9XZcj9BAI7n9XOtGoazgFNrlZqf0fG1ZV+FMbXW
         kcpwl+Of2pYxVTlHvFgWASZ6JT0dm10Wvp5480LJ15BW7aTZTSE9YyRJreMmRp57JYGD
         R1IwRIbSNjr1qSgGEpQki+0BwLKaBNPciSaKb2xnxaMsJ7iTpei1rfkMCSRpNNLnRXrI
         WVKa3PZeq3GsH77XsUl+aC8NAnbi5GJgKSJWLMYDX5ZIqjDokbMK6d6h/EVNnJMKPEcn
         W+8w5sryipUq+1nj09xCOMRNuW3Qe4s9dE+SrHIjpMLVi7vNGutVnQ7TCHg8w1+diwAr
         fFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659865; x=1788264665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=N9pFILqW97MAZAgPkiSuJcbj5DQBm+pXod0vMxC+SIkQxu1h6Gf194Ev6MsS5hh7yW
         I+f7DKzzqG54Yb3rXZcLeQnxOPJFkDlPLU7NV+Fxb5/bXT4gO44vIRUm+VEPe9UsqvGF
         mWkJ04BOOpwzzxSq9MfvUBkqcdFUFcsULsu8I+i6/rVb7k8aGBXAI7KCr43TjvHNekBK
         VwS3NceDvK8LJCjNWECZBiaHeupSqu9xDxtug7J+oSRoOm4LVhUOVPQxokKEf5Ta0sON
         UX2Hiy2wGX0r2fV1h5UyD4yG0HPpAAZq2RoOZMzUjUMVX7mvi2l7YXQmJg74UYsx50/4
         3HnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbokuLh3MnSrDvxb5zFPu3etxQc7xWdCnKruhtVyJET9TylZszlIkR8J2bqL52qUf/JHDChoAZA545QgywJsv8@lists.infradead.org
X-Gm-Message-State: AFuF++nhNQhcf74F4ElzoePx13JKqfrXi3ygLV9CmBzaMCSaCLDmwRZr
	sVcOqzixwHUoilM+u59V2yunR5PXbnMhOsXj1tuFRvnbkPD2MkYJey+V
X-Gm-Gg: AR+sD10sxF6tsao52cR5ARuVOBR+rulTtzgo0KRPOA2RkyEhr/7z8gPO4594xCMMV5/
	S3CmGq8UvdQm4L6dOhnIGk9s/Xy4vnw4owZHbYcAAGgMu43HqFhMMdFJUY0yQxiel2aSD50VvnO
	sj+9aG/+N/ZSBXYhsWyOfcnFkdgZsMqo1Ay+fEpA2DZxMmU1UzloYOwah6rI+DP9buWeeCPFCHw
	GfO1lPvKv8Tr3IzeT0l3ZZfLKhWFWV36IgqXpsdLF4cW3FsY27cqgAhOIUzIA8QvATmf6tv/oxC
	ZWqTAu1kdSCIooNop20PdSEg1nGj7KAFPQesTDBuHln3BB20T0bgY4reMibiJRIxWNuLuBvLGGL
	WHjSmMOqa6gLctUHABhUULsnx4S2UBPSqAHyM/HWJ8iQg+U0KmJjfE4Z4wNjQLvmkDeZYtweTSm
	okSfaumOgTjFX3vn/FMZs04v2AUUrX6Fzlmf2ldbpoQ32Fmg5MeBIhQwwAmxzY0bBoAoQsL+NMb
	CwD2s7K0VUkNS8=
X-Received: by 2002:a05:6402:510d:b0:69f:d4b7:9476 with SMTP id 4fb4d7f45d1cf-6a5c40f286amr6392722a12.4.1787659864924;
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Introduce basic support for MR-NAVQ95
Date: Tue, 25 Aug 2026 05:08:10 -0700
Message-ID: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_051107_624796_D37E125D 
X-CRM114-Status: GOOD (  14.05  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 267 ++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0


