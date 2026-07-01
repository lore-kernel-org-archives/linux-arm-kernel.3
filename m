Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=; b=pNbVz9ibDJq5/lySRCSLrnPSr8
	7PitEYGZ2DC5qnQexYKBOLz7zvmLAsVCaqb+TJDeUmUOhRDEm0nCRq/TTzfZO5RnSQN2RzpGFtmUu
	gCNHNobrlMzGoOFcOdifwqDuyAcCuYxzwU64tIvf0rDDYTKbU/PvsOrtLgjKoK0Fo/DxlwA0P/crC
	t9Idmgdh0F0JoDxGLkuSjSDeKZ5Hnj5bjiu42eKjUlgKJONUeVLE0jnIRMQMZ6LEn8hjt8qS3Ubnf
	n8lL2xIdxIp8ey5uWTxx4nCeX5MdtPzVf60PfqFeRDMRwF+T0CPd2SDPW51XOXIasJLN3ukrxtI4i
	jEUFqZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFM-000000021Ju-3dCS;
	Wed, 01 Jul 2026 12:40:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFL-000000021J8-1fOc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=; b=JyjjPC/9iMlCOqta2a+aSwTxnz
	HOxgTe/NxEDGDYD3uGfj8i63Y0GexpYd0O+hvUEX1R9bPu4kxkImuHDEKYieclRu7SNXgvrA0mOqK
	Q9oV6co6JUBX0h9WoTC0U0ywtmOLUJt4Se+hosU4l4UazWWkLxzp2puefUlpzvNNUnlreoxYA3gnP
	iPM9/UQRm0zXazikWMlzYCEPXqcLaPjjleebg1+WwnmOp1ZkDIC/UMt3NTVzIgYeNYWqo+L6Q6oKX
	MtiTo30l7R7HQyjk3fdjgDzkiciBsp9cFbdexQZLoGdHjZ2309kzbs5j2XsjV/MelaBpvbv6kMDvZ
	ovgYS+eQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuFI-00000002lbN-04Vb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:40:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-470174001a0so531538f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909649; x=1783514449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=gdNkshq0Bk4tGyIuml2z1d9Ek2+3bLkctPMvCQ9NLTsy4SQrfLg3EnlI5nopJ86Oaq
         +wsRdnzj+a5j1unj5rb7jZJnUQC9eO/3xrpeJanqjzCC426h0cF0rd9poIlzG1yuU51x
         7MY3OAcMGYZHU9UjusoaHxy/bg6nOmCAlmkhoswnZmReqrCJcoEtXfZVhMmleyOujDtl
         cI0OyCYhFnFTb9QnPs1eFokgvTuGPH7U0g2gLRMcDgxi7LM9tF0cCk1bkvEcoUUcQXyQ
         hHolX4fBz8eW/fpKFfB+y3MminLa31TACIiaPtMP6ntaFsgIVdCP7qkamKzMrImuRH1F
         JzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909649; x=1783514449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=RwdC3iX3jJnK5dqCPTPzIe2LYtbM6fVT7nmbAb4+0YiWAz3LQwfba0Sg1HbQVGwitG
         GvzozxNSZUB9YJuvx45umIV24IJulKdTXxbvHio/3ti2YDqsdSTeRFQWirE0rFEEoNbu
         eQ3/rBI31zxWtu40ZMeWhpp04k8K0uE1t3S8F0JEge1ERxtB7HY82Ad8H6kfUesXb+cJ
         n49YAqp9YnSHNtnaJmuOcSiXDH8XREECxlX2ZegMqiIhwLLINLzBZx2yxrFvaPJCic55
         zCA88FID0r1V1haPAn/L4NSysAneWiMDjruQurHxIkzTWpIP2kncBkeTfMzz9pD45yT5
         CbEg==
X-Forwarded-Encrypted: i=1; AHgh+RqkYZd5rdK0o5feIO62AeCtrtZvOSaXlTou01wsU0Sj2LqYfWpBPQ1vLcbVQjwITXrHxdLpJ3l7Q0o2PZXpLTdq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+bJg4qLA4yrvRpsUbK4s9vZzJ0J213gRjQuTHjFQ2Q7fyIyrk
	NARozTW/lO4S+3ySyeyG14CLnZ356UKIs57sYIIYqPiY3Xx++BmEKx8s0EJKXYJ2lwU=
X-Gm-Gg: AfdE7ck44DZ1M63bSJeAa/spoWanFUTKGTSYLkrYJ0Zd9DrTMgc1o82yeLIFjJxV5i9
	nEne0M3kg99rZ8VcRgil0bym5jhxjRl3b1MXsernuyBpjJId23ZtZb3s0J+kI2/MpNXgQuTNAWg
	gpSV76Cn+OJNijdb3wDZjcdH7pFTUDE+wLb4gUxZgEmQIR5Kc/uHTcJ92acdI1zQl9zaoKXvYBm
	bhnDC+SDNLzi89SFvY7XQkJi81VBkj8dtDBc8V27bvbDNFeh+BXO4vchkAwYaszFzLHgieE4Um4
	QY/31x8zVOR8d5Z/SPdy2QE9Hv4FHkyJqWAcNJxScFjAw9mn/vhvoq+2eaN02wuByCW5Y5zltJk
	7K4ga88EuVtghJmJLg60F+yw91kq/lTKf9C6FWFFMCvHiUd3pBgJB0MSjtKgRjxwjkH/SZT5s5h
	+Pcp6D2Fe+PA==
X-Received: by 2002:a05:6000:40c7:b0:475:7de4:82ee with SMTP id ffacd0b85a97d-477b388947fmr606880f8f.17.1782909649238;
        Wed, 01 Jul 2026 05:40:49 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4659sm17892064f8f.12.2026.07.01.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:48 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:14 +0200
Subject: [PATCH v7 02/11] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-2-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXruZX/Ydn7lAu7Yh7yPip8BKfl8milRuvT1E9EDX7i
 OuumqSWjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiIiAcjw8w7HeWKXyeKSZv/
 MuRZ/HDOcsFPsp0z2aLtT7paPl58g5+RYdO1pYEr9a37Vfazvv4tt3+9w8m7G8NN91bf7wzjz72
 9hA8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134052_118402_37F232FD 
X-CRM114-Status: GOOD (  11.77  )
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

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..463a3f6130b8f2927a032137e87c01df446cffda 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.53.0


