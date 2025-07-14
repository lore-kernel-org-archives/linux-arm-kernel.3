Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A514DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UizOBT89f5MRX6YGiBh9LFBmNsdbZc9aL8t32eOk9Ls=; b=MrYAN5fYpHy4A50NsUdE7f6XkM
	mfSmhhbD2yZukBDkc6lNKQGrEtlQsj2RrIle6rABNgOOeZBblAygqQiBwPE7N3EaQQuy8SRaNt4L8
	3iGxyTPPpb0jF0GZ+N6cQnOx3GxTwN+4V2rN1f6BztjfP+zUmkl+46WTx7Eozk3LChRVd+SyXs6uD
	cJbG0jUYTdOBUJ6GoeNjUTABfP3LBZ99FsioCyOYv4CJqu8Nch4+zCVkbKtI0OKGYRpWp/jyTMrOe
	B7TPsoKByqkwwHNU0DEUk7Qv2e29TBa9VPg+nYWB5KDdVYe/IRqaKCenhUth+I1HYplMnNDBwFbSf
	p9jszs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJVS-00000002M3C-2aZt;
	Mon, 14 Jul 2025 13:46:10 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJLv-00000002K0N-1Fok;
	Mon, 14 Jul 2025 13:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752500130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLwf90veDCfX/vug+RY51XJsew+TIOZx7ZDM1Z2CSQQciK1qiq4NgD6QzC3oXvHLraPMuS9r4r08v3rRKvkam1IsL54XA/7L3kWF73CpjhwlXnBM0t877peicmCqjD9fI0I51SfS5dqZHB2BA67UOaoku1ckdm6kmCRsxMSzgwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752500130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UizOBT89f5MRX6YGiBh9LFBmNsdbZc9aL8t32eOk9Ls=; 
	b=DG1MXaTm0GH7Zzhu75mIeDgkj0NacaYQEAJk7lYWjDOfg5HqLc/uxecDifFzLmrvYKxSD/mLlrDSNnWrDi/LWRXmcQJeSEw08v1WLlNyPlLVj7mlGFKqWDEFTvHhBzwxugL0xZZTZeJ/KcEbr9IZ9D4uP1o/jmIgRTO4Vw1Nv/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752500130;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=UizOBT89f5MRX6YGiBh9LFBmNsdbZc9aL8t32eOk9Ls=;
	b=cF7SlMQIVCLi+7LyiNNzpE0msj22oD9LyCxoRHQVUNRlv+qOxfVUPSMBNdvJbscZ
	OLdlAaeWMmXFLxxuYh4gLPwm8eNgwqt4xWl52WtxDLR0xqiUT8hub7S39Q2edenUd1J
	SnxY+eKDm6GfP/fT6GS7lJF8E+rhvBO2yMuZRqPE=
Received: by mx.zohomail.com with SMTPS id 1752500120862937.2041501644019;
	Mon, 14 Jul 2025 06:35:20 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: heiko@sntech.de, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mchehab@kernel.org, nicolas.dufresne@collabora.com,
 nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 14 Jul 2025 09:35:19 -0400
Message-ID: <2229133.irdbgypaU6@trenzalore>
In-Reply-To: <20250713142514.56742-1-liujianfeng1994@gmail.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
 <20250713142514.56742-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_063619_416064_8995C429 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Jianfeng,

On Sunday, 13 July 2025 10:25:14 EDT Jianfeng Liu wrote:
> Hi,
> 
> On Tue,  8 Jul 2025 11:19:33 -0400, Detlev Casanova wrote:
> >As there is a considerable part of the code that can be shared with the
> >already supported rkvdec decoder driver, the support for these variants
> >is added here rather than writing a new driver.
> 
> I have tested the new series on rk3588 and rk3399 with chromium. Since the
> HEVC decoder need EXT_SPS_RPS related patches, I ony test the H264 decoder.
> There are two issues:
> 
> 1, The decoder max size is detected 1920x1088, which should be the fallback
> size when queryig VIDIOC_ENUM_FRAMESIZES[1].

From the linked code, the max size is hard coded to 1920x1088.
The driver sets the frame size type to V4L2_FRMSIZE_TYPE_CONTINUOUS, so the 
snippet you pointed to doesn't update the values for max/min. See [2] for the 
discussion about using V4L2_FRMSIZE_TYPE_CONTINUOUS.

> 2, Playing H264 videos ends up with green screen.

Can you elaborate a bit ? What videos ?
Is that on both SoCs ?
Is there any logs in dmesg ?

> These above issues don't happen with the old rkvdec2 series.
> 
> [1]
> https://github.com/chromium/chromium/blob/138.0.7204.92/media/gpu/v4l2/v4l2
> _utils.cc#L520-L533

[2] https://lore.kernel.org/all/c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com/

Regards,
Detlev





