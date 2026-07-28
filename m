Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E01C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=; b=4For6hFwkeiSA2xRsef5A8P3Pr
	FUdNjk5g1xn7eDgoklX7lxvNgProx2pMfnPVRZNDMKz1S+b6iRDSO+U+OGIA4CkVtnTcNusT5m+zu
	dnGYe4od4Mz+lz5oizMSsAY6NYrV1bkkYDjQtjknfQNzJmtaKjcLuwoe93Bz2X4gR11oUYebjQJW8
	Xuwxwfp5XUOSlAshBgRpsLe8tUvr+T0QyCNXC4Uk7OYhgDCYa7UjPqWEyfc3/Taj0Es/rqPj08R8i
	KTLjPxVN4uPQgfPAkKdcv1Ic79+7T+7pwwujtUGTdAnGYH7w6XAV6RVfgitID5+YnCIgb182lFWsn
	T2Pry7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohZV-00000005JlD-3jZK;
	Tue, 28 Jul 2026 13:10:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohZT-00000005Jk9-3IAJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785244210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
	b=cniiXPkPq6JN6ScpGTbB0OvPQ1xbEi0Rkn+eajuY2s0cL9Z+UBaW5IOl9sbM2IO/lB5fwB
	ANFaQXkrj5uahxQw8fzDAOJ1tvmjHTxAICIMnziB8ZVpcwNVwbUqXnKko8rgMvHA98wvoJ
	HxkhV/WdqTG6OHXvXtS1GigQfncIgFk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-k7R3lh5LMDuY36eIDq9UuA-1; Tue, 28 Jul 2026 09:10:07 -0400
X-MC-Unique: k7R3lh5LMDuY36eIDq9UuA-1
X-Mimecast-MFC-AGG-ID: k7R3lh5LMDuY36eIDq9UuA_1785244207
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso370898485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244207; x=1785849007;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=bv1tGn2N0+f0HNzjXBvhjBAEndjepYHZq59DpvSOC7OxtAcbIAnJDTBDYmjt9KeIt3
         scclSema8WrUQGlNtbWnpDEbtsV1ULeLOKrsgm3rsyzpS3xBKh/F779ayaB2AgNwol1u
         o+BXd2JbchJ+8K5zUpfWvg0fi6s3uEH1t2jGHdj3332VVOYCFxRyx381eDd71gS4AbnX
         pWtKLSKj76TcmjJgfczqQE8/Mgt0HqARvqhggp5VpiK++CJrs22i9LzVQwUfZXCxgBqw
         Z+H3E5LWAH49FUbKl8iT3YCrWAzLmx7OL3fpjCiWnc/NNzHK24afH80eVC7HVid/Tt1O
         ppqA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ8aRKf94IWlI41T2kPDDDq3M590GByuk5LhlJce4OFxgNuVbYBSD5VNQj11Z6RpLo3gnKWJ0ORCG7I6SbeJax@lists.infradead.org
X-Gm-Message-State: AOJu0YzGJuZyRX4ezyLBWVw+pnS+fQNSGQySCrOVgGnG5kXpZ/hlzbg6
	huHwbMFarUdi1wTekVkqCCFf1+Ymr3+iQuQmKH3yErwe7647RyjnZUy+c4aOMpL6bueUcvBjcMs
	rOwv7gQN0fUxYpXIOeq4B3Sq60e/PhpS3G/nOMfNnPx2ReuII+ZVihfniTL1yKynW4ztUaWXUo3
	tA
X-Gm-Gg: AR+sD13JZwQ8w0Kt6sAj0GLnaDTVJSFIEDHNzCH/atoUQdeglTso1fGsT+aty73x5vI
	S8E0m6BqUZyb8xB/LyVCRpmfPFV9/IJtJlmQixBIJXHgRpQQoZfi3wgUPOIBusNnQL2+cVL5BwC
	jmMemFsfIyCjKkPN8YuE/YErLlQfjHy2A4KH+Q/Ms8RZJXfS8JNbvXLbEwdiru3isHTqKxOFH7g
	okZ04VvB/Hw+hfqJSBH4MUxqLI9put3D5X1RRydm+dEr7P9uQGzhayrVymhFklyfyYlgf17MWnb
	3YHwG6NgvvKZ2P+/zi9tkit43htUAmsWy3MsdcpGkU+VlFTeAnhX6BFMHtLSI4ZXIImdluV8Fwd
	P5t9osJ/bcPxf7eL15OuOCgCOXMdtNiyrgCE=
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215985985a.27.1785244206244;
        Tue, 28 Jul 2026 06:10:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215965785a.27.1785244204887;
        Tue, 28 Jul 2026 06:10:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de635f6csm831797885a.26.2026.07.28.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:10:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:10:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amiqKRkFItYwD6oL@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0BHQ1BW2_mydvuXi1W5mrDurWOsTK8uXRHMiNiXRcpk_1785244207
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_061011_892026_8276FD9B 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Chen-Yu,

On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v4 of my MT8173 PowerVR GPU support series.
> 
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
> 
> Changes since v3 (all in the clk driver patch):
> - Changed pm_runtime_put() to pm_runtime_put_sync()
> - Added missing of_node_put() in remove function
> 
> Changes since v2 (all in the clk driver patch):
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> 
> Changes since v1:
> - Adapted to changed DT bindings
> - Dropped driver change
> - Use same power domain for "a" and "b" GPU power domains
> 
> 
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.

I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
go through the clk tree? Patches 3,5 go through the DRM tree?

Brian


