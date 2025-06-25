Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1532DC83000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 04:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=; b=i5oaxkS3sBcMgv4sC5KrPPuqPS
	r9UGKGGPnUbnpT3yfBCmzR6r/XJzfX5QlcbqiRylO0EMm4NRXR2gkOA+BLSFFsR8lrs4e+cRaoREp
	4hy++aX0qbmEYdFtlLfEUo5O+MPV3/mnPtS9oyJI8mWtTvAgdjpM5drNrAs/cmorbBlEZrfA2J9Ch
	vjzsgygSHg0YJyrhh9xFrkB6zuOFZqM8oQvoKvPSgYR0OpDrWkHjqQMge67LGZgVivgFyOOf0SNHf
	OsTGqFetFCJlrDUBt7hBmL2B97pt1LayQivcFo8tEZHaXYpTVHIXLVBPmRTJAqu0yOD+49xx3Vzee
	gl8eFlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHY1-00000007Srj-3XLW;
	Wed, 25 Jun 2025 04:15:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHVk-00000007SbQ-2dGG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 04:13:25 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso3356687a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750824804; x=1751429604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=WtHjWNwzTBQ549579CquSo6BPl1g9JOSRIMLj4c86CXsP9mwCqRfjbSUZYEGFFLkTh
         /azS/mpfE3+1V2d1KytwVAjvIP9ZaaEw8y52zRXvAzxn0oqwawHFHD5GCJGORXFcLhKc
         +BUQUzAf71Fh4BdqIUALjoLtZgGVzWxfxIOW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750824804; x=1751429604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI8g9zDb32PRY6Tspe44/dIo1kkI6accqktlnUtJV+g=;
        b=T3v+8gsKvfvYEAZaAgGyLTYRA/zPP+FbeRJ54aJiwNZl6mEsBH9r8imFZUmlOs0Qms
         eckUOrNE2UkiL+YIGHIADeZcXAAU5Vkzjfj6GO1bPKoAHjuczHMBU1HYZlO7mmwYy90K
         VHloiH8SNnSW7XnynzD4Jcxlyz2gs0PNt2E7uphcWVPuQ2tGxAvBvWwmC0Z0n+kZdPE8
         xuMwt1WG0xPHdW9ICES5yzoMbTWIBzXF5VpNFnTPJzVcRNicDE3gHXArcs4JRM8HVh3S
         lk9maWjOtiDrNt3JS9pc68jZmY4k7sgOc4kw5Gb1VBQon2aGe9L54pd5n7Vv5hWF4R+/
         WpEw==
X-Forwarded-Encrypted: i=1; AJvYcCXF5XohcF8EhYfJ9/bvv3d+jWRB4dbYQBNvymtIEr86ipGWQK+AUKKhPNIThsL1xhb/N1rxWJIY2jw/KI3u3Y4m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+JO9wCC5N9SqRCybMMMTLU80FR4nvxEzQlV2z0Q1yRNQ8vDnk
	Gu2v+AjK3eEJL0pyWdd4GYCXg5F6zv5YyENmEkzZMU9DUK9g5UxH4L9wTMNNId6LXw==
X-Gm-Gg: ASbGnctNKCFitQC+3tX90ujmkHLOFRbp0s73rb74VMZVvR60EFnezZJJgGoi6zdtvs4
	ZnoYDVMj7N0FQRo8t6FmtskM71cj7/c5po3hL0fmUEdiRctIyS3RxJQeNV0NmyrTByDY0ga0EBa
	hrIg+uIJcPx45rBSUn7p1Wn0aMkVrgc0x0F+0UpgcTG8sKAcq3h5tH0l6/if1oceZr6NZ5BhWmQ
	N5tNjFbFAAktejQDrEd66w14ST9YZBs1046n0yG80QrG0YUFk33yjF9IJkh6qM60JW0k2S5X0rC
	jO7qSVYOm117UdOIEFW9MAaJiTynApdXrrsUTM6CR8ILEx1byZHF/+RtKduNxFDhew==
X-Google-Smtp-Source: AGHT+IGmeaFsOWs9kDGHeETKynTI3T+Va+KM8Ww/Xgly6I5TstSSVul+Q1Qen0PDyH+2QEgJTekrzw==
X-Received: by 2002:a17:90b:1645:b0:313:db0b:75e3 with SMTP id 98e67ed59e1d1-315f26d57f5mr2178094a91.35.1750824803734;
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54420f4sm560279a91.49.2025.06.24.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 21:13:23 -0700 (PDT)
Date: Wed, 25 Jun 2025 13:13:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <cifhvofebjuanprzcs2duv6r22r5reibzm7nub4xfya3h3rmwe@ujpf5wadwh3c>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_211324_685455_0C5579B1 
X-CRM114-Status: GOOD (  14.23  )
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

On (25/06/25 12:56), Sergey Senozhatsky wrote:
> On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
> [..]
> > @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
> >  	WARN_ON(!host->hsq_en && host->mrq);
> >  	host->mrq = mrq;
> >  
> > -	if (mrq->data)
> > +	if (mrq->data) {
> >  		msdc_prepare_data(host, mrq->data);
> > +		if (!msdc_data_prepared(mrq->data)) {
> > +			/*
> > +			 * Failed to prepare DMA area, fail fast before
> > +			 * starting any commands.
> > +			 */
> > +			mrq->cmd->error = -ENOSPC;
> > +			mmc_request_done(mmc_from_priv(host), mrq);
> 
> Do we end up having a stale/dangling host->mrq pointer here?

Something like this maybe?

---

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b12cfb9a5e5f..46bb770ace41 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1498,6 +1498,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 			 */
 			mrq->cmd->error = -ENOSPC;
 			mmc_request_done(mmc_from_priv(host), mrq);
+			host->mrq = NULL;
 			return;
 		}
 	}

