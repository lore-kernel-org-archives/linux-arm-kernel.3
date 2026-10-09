Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD24ECA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=; b=qkk+KCWJIm/fitmsRjAUXVIjD9
	ulbO3W2A+AmIrv8X+OdCFu/ril6kuSkvc4yrGAiekqbUEj+ysy25X4io/E0Md57qJpJS6L/Bjzlwa
	c7N5QOF6Od6/We/EKcj/sM/I/xNdJFTwuiSb101Qik4mwu87pBQFbJmcmXIhGYE5C5SouzVFg1M7o
	laPi42Rwi2adIWKnDOfheW2peA0YMkiw4jrSR4d3qHbYk6s0LiOsuNF96hR1oPA+ahUCaF4YQcIqi
	/Or14RQ1G/DQXOXZ1vjqnXSygiJvX3c9rnTwZqQ1APch2bS968SB6W2EfmV2VX0dZVKLtVFmJOtvn
	eGHrBKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4lr-00000005hB4-2fAe;
	Fri, 09 Oct 2026 07:11:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4lg-00000005h6k-1b7O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:11:52 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso7939175a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529906; cv=none;
        d=google.com; s=arc-20260327;
        b=sPgk//2KtH09yQjKEUADwHgVkB3f1+/R8IGE19X1VLmLbJaW35PphnFglTCt+IB+uM
         MSIFeXHyaJqe2DI+HmfWci2lw4JaE0LT2KzCZlvCg0FH5pgmuFyFWqYtJ95+JpJoXBCL
         BTIMqT/V+auj9suMmwRYm2XpScoRBGwHCbz359ADeLkEUfKdqFtKjz1HZNXvP8ldE+LA
         pK8yjOctD+cpPz6kB7jKZ7js33/by1Rl9jJ4/vdMZJ8eYIH7PgJq++gkPjdNvOdXj85x
         1H+mLYUhtXz7Ydq2UovPjXzdm9yzMYJEgX7GP8lfDOTAQQEf+bMyLYGgZi8pHMre5J6y
         xJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        fh=nQ496SvaSECBO0AaEJVMQQNcAIz0QpdvzAIdoIHwe/o=;
        b=ByyN5uAlrfE+/t8nr/X3/jVGe3C1yc/4uzatR+b3Q4yfvIaK1E3kHIx3OBYm2mmmcp
         sys74rYm3hb4fjJG6vURZfMoxVb/vPXn29jU4nW6K9AvbHeK6f3e42JnTFhno1SDx4O3
         e67e8bonevRomyfsyglXKF5fF2nz6ORMsF4cK9PJo+mKZ9V2oZOCfglv/E4IflyQcX8S
         D7fsTKQCJR7utIBg+acWOxNPD6OkeA9cnALYMCtJJQ2c9N3DTBXYLBENruqL763sQhPp
         2pvnYQ7oyWKRYZa7YDKYXIazL4JemW5Y6Ptw9VaKBT+oiwzs/oiipoWq/aBGD5BCdL7P
         5lFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529906; x=1792134706; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=TFoeP6z+Z8RPz6xd1rK4fbeVFWE+radxB7YnsP611HDJtED3ktr0YW/4nEr4ZLLe82
         96YZF2vNAC/DaygqcFS3/vPiDd+/qv3LPkXEZYab3aSNWyn+O9FSk8hQDoCsDP2VPAor
         qzfQ3l3tZ+HTIOZLLQNwQ1F+tXE7F4Vv3e0G2VCkkYJXA4SYTpCwQwb3DHk8i2kd0m9x
         p+9GG0p9ofwkhK+6HkBoY15cq+VwYY5sBtTR0uj0p0iDRCy/As1Ruw6kHMausfWTE7jT
         +fLGaLP5l3huTjAwY05NptbZDPF+ampCrg6v8QmOpnx/uaI7m8rcIUIFscy+uJL6uTAa
         Om9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529906; x=1792134706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrOU85VuNZba3sZV48gSiTp6ifwgbG0aF11o1sJywTw=;
        b=ckjX6cvkDMxeG2Axpf0AgFdpOhgJDGs5aItZb5m4NdsFQfI8BTqVKvm/DMshETVzPv
         yyW4IdLCwz3ecKVz2fnbNERaas4IWpqjnZi7Qw4RpZ6l5ZdRMOm0LQbwbU/A+ZBwlb77
         DE5/PphWKgaTKf9AdGR/aGo1Z3vIA47ljkWPznSy5Bb0EgzoSZraGF9KEYNZZOZRCnfG
         27uQ35WMqrbWlntLrQGsYEvXo1KKU6Lk7ky/TU5G+dthpBQ6wXXhmXWpUBEkilm0rUcB
         Y0icMBo3Ur1Z9uDyJArtKkLlfQiY2afxvqEv3eDvKU00te3GPNzQ2Eb/M8X4tOiJ6Uxn
         5NiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4pEkgCMbuB6N9Bswk1e9QzKkHn3Y5hxqHSYN4R8pRvikDgq6VXg3nkrC+LrYWvNyoM9Xzl4OGQ6+6FXAUJZpx@lists.infradead.org
X-Gm-Message-State: AFq9FYLyCL9Vr8oYiaoUhwp9jJXZm3AFtaTAHRbSm7RQs6p3b5yZFLk1
	XrvCGzSW1L5DYRE0WiWDXuoug2S+BoWcQOmHehSI6IKZxDDPqsgaLoYgB8m2kHPLNmmA3xEGEcd
	bKNquCxq9giF+IFE4WP2LvXSNIe8i+Kk=
X-Gm-Gg: AYBFou3U7bwqGpPBxA7ss+ZqyjhCB3uLHE36ofE+XzlCmEsZgJkQF/owN6hwxT4e5um
	pKRCy0oBxMYBtwQLg2ywkDsbY61CxMQy8kIYyyDmdrTCaVY2vko1Y83wcQkbfI32hskHvZJMjwf
	tdr/vTWV2eRMRBqu8vW+EPaDP1/l672/O3LGcFxOi15n7cIxZkXwRVPrnLmUyfTH26FTB74kKOu
	GruxP3IEMuDdpHtPwID0DR18Y27z9U9BVW3zjprnuxHzSbqm2Dhih3kCZQg5bszVZsc4W7RaGD2
	kNCXiLGKc3QjNQsQDeqytHiHxRysMzRnjPvxLc/C6QdBq2bYvgJWxu2t3rAJTxdnR9X+0B4K6s3
	b4fwdz7v+OkmDhSb9AJkz1dB44XycFf4uwmwQbovdpWMnj4/I6m11GkS2PBdSUz+Iy0U=
X-Received: by 2002:a05:6402:42c8:b0:6aa:9fef:641c with SMTP id
 4fb4d7f45d1cf-6b17c2cbe9emr672146a12.28.1791529906210; Fri, 09 Oct 2026
 00:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-6-phucduc.bui@gmail.com>
 <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
In-Reply-To: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:11:32 +0700
X-Gm-Features: AclHuK-rdOMioEF7bIiE384aI3Wbo4oyl4-CcCkNK2w8cU-mlh0smKvKyqU9pyE
Message-ID: <CAABR9nHpfwZ3Ma9pOTiY5eMN01Exfez1YahdUL9g+HCq2gwDXA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001150_055864_52682EA8 
X-CRM114-Status: UNSURE (   9.38  )
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

>
> Should the START/RESUME path check this return value and unwind the
> trigger state if enabling the paired MEMIF clock fails?
>

Yes, I think it should. As mentioned in my reply to patch 1,  I'll
wait for feedback from the MediaTek side before sending the next
version.

Best regards,
Phuc

