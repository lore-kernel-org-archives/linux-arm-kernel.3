Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C419FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiYUmwan2a+kfrxXxMqe+npus8z9DGrn+GKVxPMVh9I=; b=lzCIV65nQd3FVg3WweNHMhOC9I
	Ore1Amh9WTrjO0qbvXaHYAQ3wFyhpsI+nvEpm8AIkTSgXEhltpp2YwpeIupoclelIsbErynAoipjb
	2eC3UTzgTW1kurnZDmg+6JRr35W8gbe3ueDM86RVMlITejp4lVUo5ulhmHaYyOAkHYnNcMoYxkV49
	45qKKXAa1OciA+ocdxb6y0mAPXT/DGA4skVHeExStpwn+WFUkGTVRjSQbPGOJJ6/cuUzw+bGcQ51q
	2wGmYy4WSs7hQuK1PJ54kZ7X9xExQWqijue1F2C2IWWAwMhpeH40NVtT4LLoTBId7z81I42O+oyLj
	rzVS68Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZ6-00000005Xyu-2vPc;
	Sat, 06 Sep 2025 00:14:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uueow-00000004yxM-3sRc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 22:22:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24b21006804so26952215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110934; x=1757715734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiYUmwan2a+kfrxXxMqe+npus8z9DGrn+GKVxPMVh9I=;
        b=S3cpyzG6yftF0ovrxUsTSzySAmff4PwjuKv8iMPSSAfEiVyfqvSfsVWdKHudxgpp3f
         GPs3R5x6+6Ms+yxn1idAyyr46hL2qnQLbJWFefwmmbTagK+6O/XUueXLVKxjqm/E3goq
         mtWDm9S2zShCZrQU+eeaJ4i4w/9w5yOn8sf3qXQvNyZ1/XQx8m1zzJXj1ZzgxgTiYW8l
         e2wgI3elvZzhDyZR7Evd9KJJ1ifu3Lpd9yEAjVlo9UMNsUuW8rXmXSdiwSIPxVpBtOqZ
         lq0hG4YwJHD0+CDaHzYkH4PXk1XDz858OIXBT1X8HGtkfc8AP93sbEbgPpp+1F0wqbZE
         1flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110934; x=1757715734;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiYUmwan2a+kfrxXxMqe+npus8z9DGrn+GKVxPMVh9I=;
        b=ctriPIiBAaKwaYeUv1wkV+dLa/M921E4DFzeeRlRhTTzyDIOKpaxK895r7G+VPyJ++
         vOk2AulVBUG55Tdmc6TXOsL3Qhxlaegf6yhnQ3WRch5L+RvHcAVZuM4zVYw8pyqzH/BB
         Z3npb1vb12L8LFZQ/GFwh3lRVHT5ZxcakRRN2HmbaBfpTlRmf/sDCwcvgzbZOQa8IOyh
         qGHmEISAh8f4Ou/FdM6us7g/NIV0+TEh7lzLat0gdzux1G5MbwKlvkHhNTDxB9m0iTMu
         8pO4rUw3R3VHt4unz73JGWoyULjIMmq1MzvECzSay4EzG0kjxnAZUGg/UV0GCuN8FA60
         Nabg==
X-Forwarded-Encrypted: i=1; AJvYcCUnWo5R9MIzLEEz1KeK9BzU5ybLWFeJRefdwVmaSI2BcellueNRjAC4sO0YW4XHLuXUbuVdkJRrk5rC2rGfidqK@lists.infradead.org
X-Gm-Message-State: AOJu0YyOHmD+Krr53VpCGXLk8i5R91t2ZZXuJFPxhwrr5rPKwhHgcK4v
	WQtFusHl9+n6HY2+thw2WREe3n42912bJgcsOQEnP+Zu8biIODnIY9np2gJJILpRv/Cpw9zSugW
	HBLXu
X-Gm-Gg: ASbGncudSFKo4WJcQuxvdBZZSpTeb1Zy7If67OaR2ltPOyuIRJ8Sq6f6azfHm8Gvsex
	p3bklCRCrYOlKddHsmKzxVnaNM05Mdtmag/gWjon9V5YvXuT6HUT6SxEJMHNiSouZjx+RNQkk1T
	yGYy+Ke9QnTJllyzi/14f96fvx/pjIfZX7MMjbr+cOxIyYZ1y9AtsIINO4MxjrZ7QM/VOJvKXrq
	jwfLCpQtt7jZdhGe8vhZi3QhdaEHxkOCM7joiaSLuMoXwSsocqWBskgeVWiECsbN1hpcQfMxBeS
	YLEiL/dKvDCUaM7HmbJ6d5cu1KaGrY0ubs1v/jVh1LQHqKrVcRkxX5SsD4WhHwQQzYvOlyMRxSZ
	7qqoNCsWV0Z87E/+fZoi6/ZlyXMDoWXA=
X-Google-Smtp-Source: AGHT+IGHJWZuIgRAyT9zDVhr8nN6RGJKLHHQvXkQ2g6HD6wb1cHUQurMIYZhLi1IBI4WggIZ+0i/Gw==
X-Received: by 2002:a17:902:a5c3:b0:24c:e9b8:c07 with SMTP id d9443c01a7336-25174374060mr2170575ad.43.1757110933953;
        Fri, 05 Sep 2025 15:22:13 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm103698335ad.39.2025.09.05.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, Yang Xiuwei <yangxiuwei2025@163.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Yang Xiuwei <yangxiuwei@kylinos.cn>
In-Reply-To: <20250817083449.2249268-1-yangxiuwei2025@163.com>
References: <20250817083449.2249268-1-yangxiuwei2025@163.com>
Subject: Re: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Message-Id: <175711093307.666031.7544773009023816119.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_152214_966045_03280604 
X-CRM114-Status: UNSURE (   7.50  )
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


On Sun, 17 Aug 2025 16:34:49 +0800, Yang Xiuwei wrote:
> Simplify error handling in OMAP powerdomain, voltage, and VP code by
> replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
> IS_ERR_OR_NULL() helper.
> 
> This improves readability and consistency across
> omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
> voltdm_reset(), and related functions.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
      commit: 045e81d8d7e65baefbd4dea0503ca3330f93f3e6

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


