Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9C1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=; b=XNMQjOA5Ap+WY+AvFTat5k/mHX
	zNfHMjqZSqcHO8nPtdRdvJdjCosalDNWcKp1j9sb0m4kS8XC+2bvvOZsoo4H9UTHusbPpcFgKfCQv
	zbMd6NuikRY/kF2sRVzxCUwLoDJ3Y9y6pE/soUEt318vy93N4l97CtEjpKIpm2mustofmR8OhtYkr
	bpM5ipLm8fzh8LvZYn5M/NbzbZmfDBcoRTp5DCy9b69zODI2JYS7lUCfQ3Ttzn4NDI1tVw8776K/0
	kp/LqwiKnmVArysmfPACKMBgLayUQaCtWvBqfAeax5rv1aGnIaAR44drNeLU+JoLu7c/bfbvc1fgR
	zypyu06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlGv-000000011U3-3TFg;
	Sun, 14 Sep 2025 11:51:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlGs-000000011TF-06eJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
	b=gTkjKwx56HG3L/6Jd8p8Zge5zRjHrLS1m4v3+nYZxqxyIOsbJYkcQtSR3FvHTV/3bAkH9l
	qxM5L7Oson5P2UoxpOILEXTUscojoy75ZahCLE7kV9Vdbu3LvHgZOVmSZxYbxRe3a4wz3L
	NfLO7jNYT+bT6OyO50CzINcoKHjX/zw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-mwetfk24Na6P1yvn4ThwaQ-1; Sun, 14 Sep 2025 07:51:50 -0400
X-MC-Unique: mwetfk24Na6P1yvn4ThwaQ-1
X-Mimecast-MFC-AGG-ID: mwetfk24Na6P1yvn4ThwaQ_1757850710
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81678866c0cso653206485a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850710; x=1758455510;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
        b=qOjvLWMra+zUrQ/KnI5mIf7MD6hlZkQVKrpeYkMetLAH4FGclD7EmbWSK97vjgFXLF
         q3dXb5mHMFBHm8N5g3ETs2gKUozcZZlLBu/a1Y3PvygiaBvfbXHyoXfkW6+lOTb0EEtl
         zswqPTkGGvCILukaADuzQKOM3CFGLvDhNeu6h5wIgzbqcSoi5WfMSE036OkTgdlYdABC
         kdidHTHMbbgIbMtV4iF1gD/p52dUED3oAhW6W4U6HBZVmLn6cViW7sL+m7E0P5jGFC/4
         /duAESUGTV+uywh5crGb6btoMqhPIYLtM4B3xVQ/aGJmmgrcm46hmzIv+OQcPjbRIkzL
         Yvhg==
X-Forwarded-Encrypted: i=1; AJvYcCVoIFQdqWIq2kRcEUXHXJmV+Zy2nEfT9vQTOV3QjmRh173yUaT6GG0oO/gz+h3rneyZvTJCb0VwHhNQI0FEukB7@lists.infradead.org
X-Gm-Message-State: AOJu0YzXZQUXWePtz1/dt84ZRR+Bz/zMGfoomDUhsVcP5nr1zNE+W9FM
	DvFmyszS6Vo2j27PlEf/DShNDQK8MgMgLR7UpICdSdRtHQoPe0mItYrXcs572Aa6WLrQROn++dL
	PNLTP/384kjmcWHZmXIpA4UhbKPyiLnkEwrPhxQXH5Yj+gtOMpRzyRm4Bh/5VTHpz4DIg2IdOW0
	Zw
X-Gm-Gg: ASbGncunAOPnANMlAgT67Fs5u7oKTBi+nzCAzH/gLFryw2dIKzQVBnZSnRlo9i7mdRp
	UbZIZ1uHKXN0LsPb5plKKPpiKvZNZlzDwDD5oYajDdjGtD917TBjmDsKtPBP3PxAuadyK/zstCI
	7DaAMltGShGbC0jUcWeL/5RF+swttxZUU3EUKRu8HQFVm6xryYrNDKlUmB2VfRpAVY86Rbq23RC
	t1opwfQmcn4Hrhk+LHd0vpxtdF6eI0qo2s5zf5vKY6UPXeQCDDD+VVjkwhc1Tgk5T1IoE0E8MQJ
	Ok3Fo2vmWhTh+VqLtUBka/b+RGxk33B9vbeVNL3rn1xU2m/sYX8JzUDbNK698SZOQhikgO+OkzA
	aGUgPPyWUzkPcG1w4EayJaIjtXpZ7a3c=
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163551cf.58.1757850709653;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+XRwnX6jGuwsu4a3hT4crD8COQvyH3Zc5Sbne0Nd2VMEI38oG/sulJqcdFsNqwfss3aWZQ==
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163311cf.58.1757850709265;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639da9e99sm51613881cf.29.2025.09.14.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:51:48 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:51:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to
 determine_rate()
Message-ID: <aMasUV14w0Dc1ki0@redhat.com>
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: woMfsYWjm6OnFughKlHBhNYeSA5HPcenAN5qKEMtywc_1757850710
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045154_480935_2E2140BE 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Ulf,

On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Note that prior to running the Coccinelle,
> airoha_cpu_pmdomain_clk_round() was renamed to
> airoha_cpu_pmdomain_clk_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


