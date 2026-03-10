Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6656EFCC9AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS9VzDgzb4tGHuCe+hXBByU7p4QSJ0iEjmhSlRsitWM=; b=P6rYg7+UUsp1D7+8eOWCWHIFWD
	7FShu6j8Z8ljE5akLE7zo1y1knHtcYiPEDQ+TJ0vAkE0Rgkq76meENFtv/sTnGmjIwURrXoCsbrCC
	bk6E9z8EIyARfrgRbFEAcFbxFfCawEaB7kh47fx5F9ahigvXDe4RQJqopcZe7I/hlU5dKI2j2Cb2E
	09OfnCulF7AYvyEu7hUqsboSWvUXHJKogbYb7HJuuiSQaYzdlcX9W4iyEDL3R4idvQvxQqry0cLKT
	kGw3LaoSb+f0H1tPO3vPspnH04AN160NUN63ayblv0KNQG/ziPs3baE0dBDTYgJx7/ZDkJ7ayJn2f
	JtkghxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznJM-00000008bRu-3lMW;
	Tue, 10 Mar 2026 02:59:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznJK-00000008bR3-1PK3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:59:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-359a5d8b3f8so3995637a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 19:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773111545; x=1773716345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yS9VzDgzb4tGHuCe+hXBByU7p4QSJ0iEjmhSlRsitWM=;
        b=kyv8eboG5UXmL6VzKkJ4BhJ3e0qPx9+Y7ksM6fpiwcGZNX3fcMVcfkd3VSRVXwE3pX
         TBvHPO/kC4GZSzqgeX2ntxDmtBrJE/JOmfyS1hOzf7seN7hrNGhGJq2vxAaRwTIi8FTH
         K7fA7n6NZQ78zUEXHgsmGGPbYN9zOsw0JPb1iCb9kAvfOyCR5eqU8mVXk5fyBm717xNJ
         DIIwGhHOYMaav9NqD/jugMfHzBHYnVp5HTBIf20YA21y8n5fpPZ7cd4dTddctd1Zn29D
         c1/Lx1Y2CgIPjN2V0nG3VdhCJ9Gw0w5adyHcQ0mF9zOvb9xSZJPOiLdI9HQHZxGujqON
         CryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111545; x=1773716345;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS9VzDgzb4tGHuCe+hXBByU7p4QSJ0iEjmhSlRsitWM=;
        b=gE+eEbYjTR3FCOGDMJVZWaq4zSqklvXNZxOXeSvv41HJA+Ai9VxytYa44l0dFGBMwk
         N7T3Ztx+ITkk2hYEtWtUhIF1/6V5isxPoC3fycQeH7k8LqUe8l5YMyXH2SBwr0WQJq28
         YIo7Q/E4hnjYjiT0rYBa5IQVVF7fVthKhV53uXo8QnGUjbz5q4ktt2BVRiQ8jTxZOFb2
         9AiYRST6wYak/G4DT9pf34uz2HFgO8MPQFajahQiMJy1p41V/n60sFfSqf75+cYZW75+
         wHsX9Dm2kw9BnoY9mTMxLNk4Kqz63X/nv1ZXPrfqp/dB7Ce5mMW1hIOfgfCGgAekbG0L
         9o0w==
X-Forwarded-Encrypted: i=1; AJvYcCXSXjV99LlFWAe3G80j4UA2AHqLDbjGGf+VgPyDN4WGLp5l3f9GfhwsKFvUzMo5pksi0QLZnoNKZUCMdsT5hFSn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb788dRCrzz2ynXxTdTG0HMGT3By0A+CqoPvz91kfaEUAyDd/W
	pMMXuxBzYMNWO6DH8DURgqD4A41mK2j43q0N7Q6H4pLHrmmjKcCN+POC0iBqOQPV
X-Gm-Gg: ATEYQzy+M3QJCP6tVFK/p5IarD6ZODIkR3/mvSvmM31m/rcKPr1/MRYD5DRVhjAgrux
	vgs1Ax8PbReRvOOi7JvQPdFbsOSeC79BU/Ax/gI/NsGq/KxXVYDDEToeAdxhylrtpu+p5qlaHXK
	60szX6kyJk4FHilhqCx/X+4gdfdsj9Fat67r7/APVAXQX8FN+HfiVPYw5dvOtJgoDx54TJl5YI+
	QLgUJBJdBAX0yt1RL/Eyrt6b+Z/t5gR2k+ecbDGmxUF2hkbKTLLgrzk+NVlTfR4KY+LazaRoGTe
	WKHNU7k1Eo3jWOE//GkPdjmQa9jfH0vxwC3QGVRWJPr5AlwFf5C0SSKqRw+ggS0IpPiNoFFNev0
	MaEt6pfQhAgdrv3ihi/TkywV46lw36qLWb+7UFJd1fqGYFNT9ZBRJmZz5gF2NU2uYbIoFtn+7OA
	w5VC9nF3x+u+PlAA/ziUl8+k6Fb5ZslFuRnQ==
X-Received: by 2002:a17:90b:1d43:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-359be30827fmr12323882a91.17.1773111545240;
        Mon, 09 Mar 2026 19:59:05 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:53d0:5b96::e3a:5d35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f08c4289sm1115534a91.17.2026.03.09.19.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:59:04 -0700 (PDT)
Date: Tue, 10 Mar 2026 08:29:00 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Frank Li <Frank.li@nxp.com>
CC: mirela.rabulea@nxp.com, mchehab@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] media: imx-jpeg: convert kzalloc() to devm_kzalloc()
User-Agent: Thunderbird for Android
In-Reply-To: <aa7tLI_S2VYrrKdL@lizhi-Precision-Tower-5810>
References: <20260307210404.1428894-1-sanjayembedded@gmail.com> <aa7tLI_S2VYrrKdL@lizhi-Precision-Tower-5810>
Message-ID: <4C4017F0-1288-4B08-B2D6-C038C884AAAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195906_375231_F01FF665 
X-CRM114-Status: GOOD (  17.39  )
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



On 9 March 2026 9:24:20=E2=80=AFpm IST, Frank Li <Frank=2Eli@nxp=2Ecom> wr=
ote:
>On Sun, Mar 08, 2026 at 02:34:04AM +0530, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>
>> The driver allcoates memory using kzalloc() and frees it in the relase
>> path=2E since the allocated memory is tied to the lifetime of the devic=
e,
>> devm_kzalloc() can be used instead=2E
>
>static const struct v4l2_file_operations mxc_jpeg_fops =3D {
>        =2Eowner          =3D THIS_MODULE,
>        =2Eopen           =3D mxc_jpeg_open,
>        =2Erelease        =3D mxc_jpeg_release,
>        =2Epoll           =3D v4l2_m2m_fop_poll,
>        =2Eunlocked_ioctl =3D video_ioctl2,
>        =2Emmap           =3D v4l2_m2m_fop_mmap,
>};
>
>Look like it is not true=2E =2Eopen() should be called only when device o=
pen,
>not at probe()?

You are correct=2E

Since the context structure is allocated in =2Eopen() and released in
=2Erelease(), its lifetime is tied to the file handle rather than the
device=2E

Using devm_kzalloc() would defer freeing the memory until device
removal, which could cause memory accumulation across multiple
open()/close() cycles=2E

I'll drop this change=2E

>
>Frank
>
>>
>> Using device-managed allocation simplifies the error handling paths and
>> remove the need for manual cleanup=2E
>>
>> No functional change intended=2E
>>
>> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>> ---
>>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec b/drivers=
/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> index b558700d1d96=2E=2Ebd4b5f08a85c 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> @@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
>>  	struct mxc_jpeg_ctx *ctx;
>>  	int ret =3D 0;
>>
>> -	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>  	if (!ctx)
>>  		return -ENOMEM;
>>
>> -	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
>> -		ret =3D -ERESTARTSYS;
>> -		goto free;
>> -	}
>> +	if (mutex_lock_interruptible(&mxc_jpeg->lock))
>> +		return -ERESTARTSYS;
>>
>>  	v4l2_fh_init(&ctx->fh, mxc_vfd);
>>  	v4l2_fh_add(&ctx->fh, file);
>> @@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
>>  	v4l2_fh_del(&ctx->fh, file);
>>  	v4l2_fh_exit(&ctx->fh);
>>  	mutex_unlock(&mxc_jpeg->lock);
>> -free:
>> -	kfree(ctx);
>>  	return ret;
>>  }
>>
>> @@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
>>  	v4l2_m2m_ctx_release(ctx->fh=2Em2m_ctx);
>>  	v4l2_fh_del(&ctx->fh, file);
>>  	v4l2_fh_exit(&ctx->fh);
>> -	kfree(ctx);
>>  	mutex_unlock(&mxc_jpeg->lock);
>>
>>  	return 0;
>> --
>> 2=2E34=2E1
>>

