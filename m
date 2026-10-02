Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54195CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=epdy6ouxIxMiFOK1ZAb3XC497bNEKLWzpO0WfXMjJnI=; b=gzqX+zrAfbLcuIfqaIUy6mq120
	f1GyJMJ+f0UEHMRQgN6bLhIatiZh2jTzyGDDoaOZIyhdV4RonFjYyBsAUiTXV3ZehiTrqxnjL7CUL
	qt9dIAMXMUfm3EF01shmGYI/uGxAAY1wXuDvNQVc9k8oYzbSlPKg+Nbg5ajBXlXCYTyuwl1jWxrxd
	xSJT4nmGd8JYi7fC0LxfD6aHnSFH5D/pJ8oRaT/CFBj8aLuEtFq1L644yrmscnsma3mdATydSMadG
	K6Y5CB73HqfoKmv9D1xVIBfbc5zI9cgTYfRMbGxN9lG/jeexMy5bstlqTobaa/GDp+ff5wgTeVPp0
	kOcENMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCazc-0000000BPGo-2eRE;
	Fri, 02 Oct 2026 10:59:56 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaza-0000000BPFm-13RT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:59:55 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so380033f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790938791; x=1791543591; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epdy6ouxIxMiFOK1ZAb3XC497bNEKLWzpO0WfXMjJnI=;
        b=DLsyxVEurhm3HTGSxXhd62IvE9JZG0wvx9ZZPToeSqNwGOTbtpxVsraXcEKp69tUDl
         ni+MouUJMg59jkpl+QFb5xgRpSc/GU93T1/4yVUsA5kgrw7RfZj7xHD3NcO2w/wU7S1S
         EpFMujzUCsm+6aBbEyJKPfOX3Z3+qcxBb89Mqr+IXQOj/vb+D4Nmbde83NH1//EOVR3P
         z5QBTvzBDynDNdoSNTyCXqd92aQT87XzWsV9d1j0f3fQLRuJG2GHp0/XesNwxgt77cbw
         tQNEiPCdlnB1ybjqyY/NmdObCL5cZmq3tCwXwdlW1XuUlTGxTaGu6GqUOetqRL6hZ7GG
         uyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938791; x=1791543591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=epdy6ouxIxMiFOK1ZAb3XC497bNEKLWzpO0WfXMjJnI=;
        b=1XIOvEQkNIUrucESv6Myi1cosMrjVhhlMQdEtT8mx7ygtRZLhd5XT/zoNoX+JbEGCv
         vFhSaQwgqehdt/5fHaEGEvIF5Of8bCBWoTCWG2tWFuNmULfmJ/GnyhOmcibYMgjWZgo2
         v5iMJGtOvc0FX0mDy3iyxEnq8ZKdcoPj2p4wX/RwsfaOHkvpylHxkIlLHQbY6gr781vQ
         h4BBLXZwL2w92IdIlpbAqbepLVkHE5kmYGhO2JoPusg9QMaLy91K5uQh/zcPqfoKlG8o
         nBslYq6d6545msgCt7bg99spHnEHVq32rOzHcBaFueapBaYPFd1HRt01ggSt5BWfE3rA
         UwAQ==
X-Gm-Message-State: AFuF++lW6zbWMYzB0mnCSbAvhcIyND8gNumZYlbgWRofV88A6Sv2e+Yg
	5w+FQCRY1MU3VqoxJGBdUmVJhLnO4izisC0YfddAfxwZeXEPb/Opd2cr
X-Gm-Gg: AYBFou1vbp9E7K004Sn0dD+i3QtXXJN/cOIzbbGDf9cAP9QL4hqjOGOhTecWEEeFPR9
	Y3dB5hHgELTbTasW3W0RS+6lvOAYYb+Puv6EDOY/M4zuGX9wHp2+iqXkOJTuRwzcArKpD3YD9Pi
	s8MHc9iSm1ZufbdX6DYmvXdKWpmzmXu3HHdx3s1HSEurwlwXG8HSGvYzkXbn2NC5Nz4ax63qxW3
	Ff0bZgsX6Rnp8n7DaoqNqoFKEOi9P+2i7g0GQ1zoeh7JxzimLCnEoUP8htVFrABJjq6RzdQABrP
	CUL+sk63GuHFDJ3Y/+bkAL75IpbM3MkbqEbq/7KxcvE1NUXW0WRTyYelu4CTUpt2ubPAAtFAa0N
	XU/0hQkQrGVQK/ELywRSwaaLseGa1XhzctKEDNzyBM4f4iO8xHHJFfDlPFPfw/nQE2TCT52cJZi
	lN58bHu+1Al90Uk/JEFCpyheP1ljwabtXYrMKwE3nAHw8fYo5BtYQiPF3fCQ/EvyXAioE=
X-Received: by 2002:a05:600c:a306:b0:49f:f099:6f8c with SMTP id 5b1f17b1804b1-4a0275758cemr31339585e9.9.1790938790757;
        Fri, 02 Oct 2026 03:59:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm78160685e9.11.2026.10.02.03.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:59:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:59:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Liu Dalin <liudalin@kylinsec.com.cn>,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH v2 3/3] rtc: ftrtc010: fix integer overflow in time
 calculation
Message-ID: <42C8FBD59AA34EA9+20260827080320.3351155-4-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_035954_313182_7F49C130 
X-CRM114-Status: GOOD (  19.39  )
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
Message-ID: <20261002105946.8rdteIpO7uWGEcTlS65F8iSi4gsRoXi2kgq8FTSaDPA@z>

Commit 8ef8e9839a23 ("rtc: ftrtc010: fix integer overflow in time
calculation") from Aug 27, 2026 (linux-next), leads to the following
Smatch static checker warning:

	drivers/rtc/rtc-ftrtc010.c:75 ftrtc010_rtc_read_time()
	warn: cast after binop

On Thu, 27 Aug 2026 16:03:20 +0800 Liu Dalin <liudalin@kylinsec.com.cn> wrote:
> In ftrtc010_rtc_read_time() and ftrtc010_rtc_set_time(), all
> variables (offset, days, hour, min, sec) are u32. The expression
> "days * 86400 + hour * 3600 + min * 60 + sec" is evaluated in
> 32-bit arithmetic, which silently wraps around for dates beyond
> approximately year 2106 (U32_MAX / 86400 ≈ 49710 days).
> 
> In ftrtc010_rtc_read_time(), perform the addition in 32-bit
> arithmetic first to preserve two's complement wrapping for negative
> offsets, then cast the result to timeu64_t. In
> ftrtc010_rtc_set_time(), cast individual u32 operands to timeu64_t
> before multiplication to prevent overflow in the right-hand side
> of the offset calculation.
> 
> Fixes: 1d61d2592c1f ("rtc: ftrtc010: Rename to Faraday FTRTC010")
> Assisted-by: Sashiko AI [static analysis]
> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
> ---
>  drivers/rtc/rtc-ftrtc010.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
> index 19e6333bfbab..b29c96be40f4 100644
> --- a/drivers/rtc/rtc-ftrtc010.c
> +++ b/drivers/rtc/rtc-ftrtc010.c
> @@ -72,7 +72,7 @@ static int ftrtc010_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
>  	offset = readl(rtc->rtc_base + FTRTC010_RTC_RECORD);
>  
> -	time = offset + days * 86400 + hour * 3600 + min * 60 + sec;
> +	time = (timeu64_t)(offset + days * 86400 + hour * 3600 + min * 60 + sec);

There isn't any point in doing the cast outside the parentheses.  The
other chunk probably does it correctly.

regards,
dan carpenter

>  
>  	rtc_time64_to_tm(time, tm);
>  
> @@ -92,7 +92,8 @@ static int ftrtc010_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
>  	day = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
>  
> -	offset = time - (day * 86400 + hour * 3600 + min * 60 + sec);
> +	offset = time - ((timeu64_t)day * 86400 + (timeu64_t)hour * 3600 +
> +			 (timeu64_t)min * 60 + (timeu64_t)sec);
>  
>  	writel(offset, rtc->rtc_base + FTRTC010_RTC_RECORD);
>  	writel(0x01, rtc->rtc_base + FTRTC010_RTC_CR);
> -- 
> 2.43.0
> 
> 

