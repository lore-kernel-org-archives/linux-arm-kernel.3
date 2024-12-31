Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=; b=OTVmfkNO5ShbC9bpJD+m4ixxzB
	/AMwyf6l1CbVE72bzFbdCyx9HDneX+sQGAEXpr5T0v2oioABQuvZG/fLhumv6KYKNbkzdM83t0Dr0
	1FnlJKTKJ48Z8gI/w929j85wLThd/QRAvraHCWhFH767uYed9bs9I2xXdCG2WVEwe6VBJT912ID9a
	q5BPKBJ85dEDXwEaMQQqZidD7mPZdhdMTD/iETao+XrRs2dShnM0wb0F73RONxp36K8MS4GmnlzGY
	29DDIVxdiComu0xSvhpznz5goWS5tRBh3S+oV3iNvhR2+EITgA31ZTLLnSiZhulbn7p39ZFK1Eyel
	/uxlW+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScL7-00000007GNt-1FBz;
	Tue, 31 Dec 2024 13:31:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tScIo-00000007G9g-1JNA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:28:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43658c452f5so14933175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651733; x=1736256533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=q2+mUgs6lNd4TxX3yYBLwcGUaUS6IghCADxw1pQsB+RxGbvxA5IrorfeyXuu9CWQj9
         nDt2xq4v/dwdK0gMMTCKbLyF7Xtq7C1uJVdGK1/TxmeBeK2v7svlPYTbVWSNS/Y6lgHm
         lwOtBzzyLv11+T6hILNHFhrC53eDtl8zQ5oUH59kIrQ+HZRtbdWf0/aXuzTfXSrenOjW
         KXFOm4rXEs8n0LreYsvGLQpCFZKy+/6onNFvJkpUT9Nw0VMxart1bxnNi47desfhs+GL
         EmxPFJ24/25SvOe+JjAfR3Dc2PaKnF2NZOh4lYFh8OVbodJpkqKkbLMLpbV2N0aKy69n
         5IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651733; x=1736256533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=aFUDxzx8yjcrTIU/ondHchLvnwflpfZ4U3OkFJsfeazDwxsUbF8gKKsbb69SAGMeAU
         Lgo9JQGJ/QLG5+ucALlp/K7IN4J0VnLcAVdM0dtDrWohIJd5gaTe6lFPfPsEuZV3nXlv
         1XQ3iKb9pCrnA7WVQ3xYML+4x7oD1le4diBEGFMy8n/+F2mrgyZ9Wbt7GFnGjJZLvnjD
         BC5dNUniaU5K1+m7/Qi4Hu+Payh5TmdbJ6zgFnRFlpToE/OQHNfQrroquWvPtvadY/44
         H/wcQKxTTD9eUR6iZVk9nQb6pfUEDftZ42m3/l499MpyRexiWveCMHCMLt7lGBJMNXQl
         5jig==
X-Forwarded-Encrypted: i=1; AJvYcCVr8kPfHttIiS/4K8mXe94LaUeGzpCqgmYBmg5zBZMdiQoqi1wtEuynBwdUZF7eRPDuVIapY2uoQNfRBxmb3BdK@lists.infradead.org
X-Gm-Message-State: AOJu0YykD2uagVaIoiPsg3GMkUeKVGELDbWIzQGn3h6eu6Rx3+n7IPHe
	trB8pr0cw+TY5ieTvsdZ7FwhwSJr1X1YQUNBbOuPGxsdDF4ozkO3xAnmdAldeo4=
X-Gm-Gg: ASbGncttZ8ahfl4R598OW2M8AJyxZ3VrU+rpQexpjnUmNO6soswpf1dS5XkHVWxpylH
	iuO00YWhzajHACvFaoLz/Ry5u4ymFMzu2UzdQNdRr7DVHZuqHvDh7vIDFeOhduTtHuQz8inrU1y
	/zEDuKMc9GE/kaVd8V6SkNdMcoz28Mknhy5oHpGeq6myCLlUtTWGcNdmR/jGehJAILMLPMtaNet
	R/BNfj8jjf6t77sfuKUC4wpM32z0fuDF7vExQ8Th80DPpxG+29M5GD3nyL7PcaYMCXh194=
X-Google-Smtp-Source: AGHT+IGxcLjjJ2Ts4fNwEdwg4O9n0E9Qk22ILcZAS8AdPDo1ohnP4lUp59rmKLtvInjoLjQjwTMaIQ==
X-Received: by 2002:a7b:c85a:0:b0:436:90d4:9db with SMTP id 5b1f17b1804b1-43690d40b0fmr73267585e9.2.1735651732938;
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:46 +0100
Message-ID: <20241231132847.135814-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
References: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_052854_349587_2FCEAC25 
X-CRM114-Status: GOOD (  10.39  )
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

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.14

for you to fetch changes up to ba9dfa76ebb030df6b605e16239a8052c3c02171:

  ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit (2024-12-29 11:02:50 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.14

1. Marvell: Use un-deprecated hp-det-gpios (no ABI impact expected).
2. SoCFPGA: Drop spidev devices which are not properly described in DTS,
   but are using some other compatibles.  This was part of wider tree
   effort to fix such incorrect hardware descriptions.

   Important: Dropping this device node will have user-visible impact:
   spidev device will not register.

----------------------------------------------------------------
Conor Dooley (1):
      ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit

Geert Uytterhoeven (1):
      ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dts | 6 ------
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts            | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

