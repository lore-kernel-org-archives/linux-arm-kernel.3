Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6B1C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bS/CRKVVoQdAkaStuerHlYKMhi3opFXvVsPmcBA81Yk=; b=bSxJ8yoc/SUOmis0WVn1SGOPjA
	K0Py5PlcCPmX1rj1eNOh7x+I2KkO4TdsFpMkxxu+YMYT95+0SyfzHKcNDnQoEZ+c/dFCxUCFNBRah
	FpYzfFV7WSj8RdVoicpTZ6b6RtmeJJOk8tqAHMKKH5j1UMZs/YINU8z4QGdJ5T2Ki4GNZd7yD0aIy
	OwmkFmLPb4cfsnhjzEIAJxRRgQ8/S8tcdW7ceaxuXwRD8QCM2EPWRv4rpi2PARmZWY3UOyDta0NJR
	1pmrYCwLYqzgQ8kAe/gjjXMPhnyPkSVHFe7YMZXDp7OObAcBzw+n1pS2u44WQEuSb2SL10i8Y/XDJ
	oSHYipMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphzf-0000000BzjT-38L4;
	Fri, 31 Jul 2026 07:49:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphzZ-0000000Bzip-20nJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:49:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4798bea72f9so464568f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785484156; x=1786088956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bS/CRKVVoQdAkaStuerHlYKMhi3opFXvVsPmcBA81Yk=;
        b=d932PQqqxK+vdVSDfctJzf16qaI/FE83yIjMdDxbTscKg1OAheWSaiQcyQi2VBcmE1
         0fhsL6++Ke9jXF4OwPScOkN5KXc0ddmhn7p02FU4kpAYfN/3N/t+sP9Fn2MQ+jNPOM/s
         oWanpzDol7naRr2ysyCrREFtgiPVIs1Ftk8+2BKkb1dD9tpBK2BA+dE92DTT5STpPnJc
         H8rg+qUlNDjX4Fjb2GpxjVkjPs/NJQeEymoMu+AIHFFyl9objewz/3g7ZVVoukTptGsz
         bkQrzSBZEoaW7BR+1MM3o2+1aSh530+S6vrbIailwj/ycvwSH2ZsOuH1rjhGec2o3keU
         fApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484156; x=1786088956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bS/CRKVVoQdAkaStuerHlYKMhi3opFXvVsPmcBA81Yk=;
        b=PJoTLv+ktoQFg+JeWQe4kAmZNTdaw6MzmTDWZ3PZgQpFwpKUueSp85TS+S0qlVQ/Ad
         6y+rwLbpNiTUGT9LUnGhG/B416OrMubOpjdjP4JTjjXDotv85Du+M5Lz3r7MQPCLFrim
         9Vu9n6ON3ivhymepQ+0nepEsJ2EugN8EjTJekBz2s9DkiB0BoQaDSM1diZB/sF4yUw1p
         vF/HIwpYrrpG0cVISt0NkQbNblAlrGCJp6wpW82d+GaxoUpYGdcXcAAe4tlncv29V+d+
         sPiqbLWQAHkRAws8t8bd/HUfp3r61HzTSvnP9fubrCoPcYtS/S6razCw5x6MaTJxvxek
         7MQA==
X-Forwarded-Encrypted: i=1; AHgh+RoaqhYZt8KOvJ4VTQUHuicSAVmfgQs9+S/xuSGhDyRuQMbIuLCwwTq15AtjBXnPMna71ZLlRFK/eD9hJ+Q7/NDD@lists.infradead.org
X-Gm-Message-State: AOJu0YxJn5J+VVH5EMtOVo9belW8RdwPOuX8Cc4CMJ/gBPtKoUedEB/t
	9lt+G6s7U5ng7D7Ad0cBCYYGFCPwDi7skn2oe1G+aGSbW4Z2rlj59adfBnbzsNP925o=
X-Gm-Gg: AR+sD10qV+Bd5wpABJY7bbNkohREDmkICu8K8QuQYlIEK3yzWFWDiAObCe29YMCieE6
	6B+tKo9VfHfySu/nHNichMkWuGa93aD8WVbvnfgP5frrMMFPUIBrH1z+hvJc5R8VVgsEexSEU8h
	yRT8wAlNNryCvi6/LqZuhGV6J9H9WtPSQqKTksUrGmE15WfI4TSig9QdLvK8u8ah0CAedtLM288
	iz02jY8uV7sCTWnOL52TcN2PehpypTAhAZP9YwwVDAC8NPwMF5CUAScrmSVcFYhEJGfM/oLjtAm
	AEJKHgKYbOI+Hxb9zOYcO1sannriYz7FEqlVzS7Yt3N81qkCWWhA33rpyAKaplFTjXuk8U4uI1d
	HgszdG9fxJTzO3Qxwc1g237kaPLGM74J9dunbBo1po1+kDtjQN7GlLXPXkpPlAhVb85ez0nxUqp
	tX6e40vgcpYkJziUYBSgqPkE67s2DIlR/INzavQkzYj5OUu87Xtnfj9q7okroLjO4sF42kI3h3r
	4lgwlZF62jeSJ+MpRa5ZRMY9wXQ9CZ2+gDLfR6R
X-Received: by 2002:a05:6000:1ac5:b0:47e:aa3e:e75e with SMTP id ffacd0b85a97d-47fd2abbb6amr2533204f8f.10.1785484155487;
        Fri, 31 Jul 2026 00:49:15 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm2009280f8f.8.2026.07.31.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:49:15 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: qingfang.deng@linux.dev
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
Date: Fri, 31 Jul 2026 07:49:01 +0000
Message-ID: <20260731074901.1163-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <507ad6a6-52a2-4c68-9ba2-5cc4f92e192d@linux.dev>
References: <507ad6a6-52a2-4c68-9ba2-5cc4f92e192d@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_004917_719230_E32C884D 
X-CRM114-Status: UNSURE (   8.70  )
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

On Fri, 31 Jul 2026 10:11:40 +0800 Qingfang Deng wrote:
> This is _not_ correct. Instead it's a bit more complicated, according to
> their programming guidelines:
>
> So the correct order is: stop TX DMA -> stop MAC RX/TX -> stop RX DMA.

You're right, the XGMAC TRM with me documents the same
sequence.

IMO this looks like a fix on its own as the current teardown logic
doesn't take care of any of this. The proper shutdown sequence is
a larger change that needs per-channel status polling and timeout
handling.

I'll remove the teardown change from v3 if that makes sense and keep
only the startup reorder addressing the RX hang.

