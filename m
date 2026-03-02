Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB77ED58E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=; b=r980b7Lqt+USvKVVQa3PbEuVq1
	bgkaTCPga/Wbcln7v3OS3Eeie+agmnzHvfac6qXZf3E6kNhVdtWc3hBfZvIGIzI/O4Vmx9WATn7mi
	bh4bi97ObKB/8S3dG/9tKW66J8tJLirT/sV3JgNS7BV8/JxukanzVhNvo/x8QyRICX43BxVLB5R19
	ivpDV+XyMH3lUDFCZX0krcnmGe2xY5/CzWAxKTRiMXutOCPwy1/oqfd+dCA8fTZMGg1G6b7JunoTZ
	DIvoV1hzIWP+0SmxX8UDyiL385+pU+w1Ka47hgIVAOEhlkpzjbiUko1tU6s6ecgcLvHwnajHAGS/j
	048N4LGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxe5-0000000CPO0-2SLn;
	Mon, 02 Mar 2026 07:24:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxe2-0000000CPMT-1Dyc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:24:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824b32875e7so1904920b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 23:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772436285; x=1773041085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=;
        b=H6QhDYTwK6+VQYxcdq8sK/7PbiKGFl6jF4Kd6GoPGn2xHpn10jFjPKPtXEiv+l7BIT
         rCLlMpt2MW6+hWlcZWqzg02V4e9Y9btKb37WXr0NUQeWYfrPOSLLEsy8PRzYixwwXSHL
         Ec2FxuobynVxnDdAoIsJyiMXs6p7I8EKH3UbAnfAOWo9mzYdt5bgp8uMomc2qX/1mKjK
         oAyQJolIR+a8s4O8HjlcJe4QqauWh33wyNWgMSJfL/bj858n2rXUPDmq/K6m/H+3mH3m
         GqE25zwQ0ioYY7uSl4JB8JbK0oK0N5l9NI6+h9U7qr15mHQ0XLFbCP61MQkTPbM8/whW
         BuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436285; x=1773041085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwUZOQ2ZJ7lWBPCWroaNir22y89SjANnXegT9KI0WTU=;
        b=Fqtx7mo2PsBmLjUpLLYvvzDSCoZxrt8xoQrQsAd32ufFl1LPDatuCAYIzIAUHpfCLY
         FaLc9uzCQ9fONvcwF4po8+ldjWXO+ErrEWzMZoFdQFqLqOBha4Hh2cK6w8Qyw7Hhtoiw
         7co97rPoATtxM970E/LjZ4w9nsE6tgs23Jqf7bjG747DX18F9tDLt5gI7gd+4tRPMiuw
         z9betD5YNn/wK68mgF2AW3VDLBQapfTkoCa+iYbEYNEvi1VRXREVVb9O1EwDZaMR6svt
         Sc1Hz5C6U37o37BaS4mul7fZNs3xUlQzhSbT2Tnpd9mrtm+0uracbMQngApgpHjpAjE/
         sI7A==
X-Forwarded-Encrypted: i=1; AJvYcCW0y36Q5SOzw2PqCR5kxp70aexhzPqbca3JDM5+RVZUPXKts6+4Fuivrn7+xstyISxBCrGZbwtJXdHMV1oMIBGB@lists.infradead.org
X-Gm-Message-State: AOJu0YyNr6xiK3RK290eNev+iE5dJUCnRUC6aOwg0Y8Oss4ldZ5XYO5P
	ZSlH/biuAkSTWtlm+uGJznBseI8akiazgvv8X7ZJxLDtzjNy8DRtToLz
X-Gm-Gg: ATEYQzxZ5wNQA/d8XkmYvHC/kI+jBDuyWUzn+g9TPz2owxwUuS//3j6bGz2YaHJDubA
	LbTvH9dMC+t7AcYxg20MpPocPGMVI94vuFN25c4UpK3IXoVx7BpYSwfb6E240EWexO9Ml7rRwhp
	tXaxPKSIFe917vMtTeKzMfL7EZQXLs0MxxDfh+IGjfxPPOW9+uXDSmEVF8YeOMriDg6NPQkMP7s
	+hoV7NtdEMqMVUoR9uKkLi64y3pHnzpll9JiUXwX9eeGvnnX8s7y3rzgT6nfcMIrmQRXp2oyPLJ
	MiPozHmGW0CxdAVCswrlzLV3rZbj+5cKEpXuihmt33wIsU+y1/6TASZef0OWAvfEIKshXc3dcYN
	nxgypdraFIKZThvDiikWlp9AwGXYjb4jcGwBlTsPvz8Y+LazqMbbBcsh7J21SPeLdEzVxpCQztq
	+Ls2lVmtc65A6s88tmGnaiwbhkrCMGnoJV
X-Received: by 2002:a05:6a00:3c8b:b0:824:ae74:571f with SMTP id d2e1a72fcca58-8274d9e60dfmr12793620b3a.40.1772436285118;
        Sun, 01 Mar 2026 23:24:45 -0800 (PST)
Received: from bsp.intra.ifm ([123.252.218.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0107f5sm11709615b3a.45.2026.03.01.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:24:44 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Mon,  2 Mar 2026 12:54:32 +0530
Message-ID: <20260302072433.5091-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_232446_324730_A6520B9B 
X-CRM114-Status: UNSURE (   7.10  )
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

>Could you confirm this from your DT?

DT for the audio AXI DMA is below. We indeed have two distinct
AXI DMA devices, each instantiated with a single fixed-direction channel:

  axi_dma0: MM2S-only (playback / DMA_MEM_TO_DEV)
  axi_dma1: S2MM-only (capture  / DMA_DEV_TO_MEM)

axi_dma0: axidma@a0100000 {
        compatible = "xlnx,axi-dma-1.00.a";
        #dma-cells = <1>;
        reg = <0 0xa0100000 0 0x10000>;
        clocks = <&aclk>;
        clock-names = "s_axi_lite_aclk";
        xlnx,addrwidth = <32>;

        dma-channel {
                compatible = "xlnx,axi-dma-mm2s-channel";
                interrupt-parent = <&axi_intc>;
                interrupts = <14>;
                xlnx,datawidth = <32>;
        };
};

axi_dma1: axidma@a0110000 {
        compatible = "xlnx,axi-dma-1.00.a";
        #dma-cells = <1>;
        reg = <0 0xa0110000 0 0x10000>;
        clocks = <&aclk>;
        clock-names = "s_axi_lite_aclk";
        xlnx,addrwidth = <32>;

        dma-channel {
                compatible = "xlnx,axi-dma-s2mm-channel";
                interrupt-parent = <&axi_intc>;
                interrupts = <15>;
                xlnx,datawidth = <32>;
        };
};

This confirms your suspicion: direction aggregation via
xdev->common.directions |= chan->direction does not end up combining
different directions within a single dma_device instance in our setup,
because each dma_device only has one channel and one direction.

>There's however one other thing you could test: Could you keep the RFC
>patch with the printks in place, but revert 7e01511443c3, rerun and post
>the logs?

Debug results with your RFC patch kept, but 7e01511443c3 reverted:
- Audio playback works (aplay plays normally)
- No xilinx_dma_device_caps printk output at all:
# dmesg | grep xilinx_dma_device_caps
<no output>


