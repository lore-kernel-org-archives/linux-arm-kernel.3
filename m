Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5897C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k/TRLRabTSJEMCHyIc7Jf71jgev3UqCsTHxCYbIzSQ=; b=Dap1e4fyGURTZKuLsy/wA0RjPa
	B+FHn+AOF+NiA7t956KvjvbQgrGxX2J7bNwgBaa2m+3W2W6JbrT3bhRCSU4jTEsrATynQVkGoObJk
	HFKDZm6QNhVsQPa0dMUi5paHRQBTaJdSmG/1iDTbFMorRqeUyyxNi9vKbLOeHjPdCn/F3aMqv3CIo
	TxqRSrn+Z9b4v0gxsUDO80fKFR9UhpMvCpMrYn6+u/DF2G3gxXe2x4fyiihfB9PvPNms7Wm7BEbOL
	1n9Br0bAvxVKkvMcVW9c4qDtoDCeKhyZqp2kvJlYc2PgKJ/j77juVDpjw3pPm7qVcUa2rXC7RVOSm
	FmIqE4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16To-0000000AG02-12xZ;
	Mon, 31 Aug 2026 18:11:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Tb-0000000AFus-0ozI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:11:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3210372a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199882; x=1788804682; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+k/TRLRabTSJEMCHyIc7Jf71jgev3UqCsTHxCYbIzSQ=;
        b=Ba3HGcrlTgYV8XvD+4FTk1yDLSlOEbRUsQcnlfyPvpCP+GSv47tqttJOWJb5mt1eDo
         CswcF1s7JyehVJuWH+u9L4y2PEtpClstiMo2Ee0m8b5ZOdPhDEp0fAVeTR5spCzT5KsK
         ubgwArBhmFwloNrPZaYm2/3CTWQoxGD0jzQ0BISvKLvx+QfWj8RLsUfWBr533ld+GdVv
         gmSyl00suCD72cI91E18cRZCR3tcwiin957DHsEQxf7qAq61PdD1eiCAGQL3AT7xeba0
         IgG7H40d/GwwzLfGXVnpAlHK1lA4nB3rhtM7uFLqQ6OQSdkNmnbov388p5n4z2f2geUa
         b0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199882; x=1788804682;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+k/TRLRabTSJEMCHyIc7Jf71jgev3UqCsTHxCYbIzSQ=;
        b=UihFOfshV9iaAjCyTyMSDQ6GuVtmfM8k7dIAfA/qLApkKCbK/7PTNN3sgeyhGG61RO
         hUSUQ684uAqfT+hQfnlSgR7SMyhx5EtrBX1tGNZLkv0LPlcLIs61wET61ZfmiOPM7xRL
         YY5vmVsKbKqGoa/WuXyj5zVkL9/nO8rso9eohaWFf3S6BmzOeqDLjonMgTh2D2EBSzG5
         4VT2RGb7NSdNiYb1n7WAs+a/YC6kWkBYpEG7TxRYDraRVrfwy2EbCgGsRyU6xtj0Y2x2
         W8vr8UYzeg+WwSy4hotRcyDu/t9turWuk6AqBIEPmFSjDGw4ehAtvOmcy1tf8XO+W0WO
         iQvQ==
X-Forwarded-Encrypted: i=1; AKwUvByb8sAdqSv2HJ3amLrsNU466kMnpp+zoc6KYKT+juFtiou0lK6GRNaZKLnmmOPkuPIkk28OAOEF6TLyNEY6JIJ3@lists.infradead.org
X-Gm-Message-State: AFuF++nnh2NzHxU00d8Tkk9O+cUYYpBiEFCjUegl6PWvE94hP1Xz9YL+
	zaAapSlqenDmma87dLhDwA5aAvsuFKU2CikddB2Cxytdx6wS7Ws0Kkg8JkLT+ZelzLU=
X-Gm-Gg: AYBFou1XMuO37Q9+gmTvZuxgS2dkA23S4r3JBEBLFIBNY/ciP9wY18YCrinThpD0v/p
	/l14mKXp95n3lzlUmn6ccuEmNXwDzBVk4mgb9ZXiP686zd6MGn//MYem5hjdVR8XJip3RfFBZdc
	DJIkEL++cyoMg5ggSueZ49sTHtPjrxUaIjgWPr+0WYLImoOypRRz5CaRnBzDCOq1zFu4WwHqerD
	H7rLSFEcqhMNDnR8OK8j6mwVJtQSQaaXbUTLDmmIXpYYOHSqV9U2TXNyJzDty0SK7q2SkWhhtXx
	AgXXxKVQlptOg/rwdgacNFdpjiO6OiUaPiLUnOToVpPAsII/aUElkyp/1JYJsHEZofprHOzHwUC
	Z+eQnKXW8gtt2IcuJ51eHf+X+Q8JGz0NyefDnVKbM04h08GkGJJUF69lcOHDfVmucGKaDcT0NZr
	3ntApj+xLDtgJ6p4FiGvjSn3owlpDJNgIaw2kTFWrGcIEmokXHvv7SgpO95A==
X-Received: by 2002:a17:90b:4a4b:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39907e17dcdmr2865018a91.24.1788199882306;
        Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990ba8cbf6sm829678a91.0.2026.08.31.11.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, terrelln@fb.com, dsterba@suse.com, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20260828212843.614296-1-andreas@kemnade.info>
References: <20260828212843.614296-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Support for compressed
 firmware
Message-Id: <178819988147.2869653.7385266758702402443.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111123_244573_15260713 
X-CRM114-Status: UNSURE (   7.27  )
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


On Fri, 28 Aug 2026 23:28:43 +0200, Andreas Kemnade wrote:
> Especially zstd-compressed firmware is at least the standard in Alpine,
> so enable it to avoid confusion when using firmware from such distros.

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: Support for compressed firmware
      commit: 20e49e03ed714b6dd47d45eed9d6f8681d691e8f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


