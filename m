Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D12C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=; b=n36uJ/tvCSQ12H3dc6CxkKBELE
	nSEkai1gcc9/CWNDJ+7f8SjdJGhpU4xmUgsOtKiOIABXiyHkRfho8b7dAFFCySqH+FcSvd8upacHv
	+c6uGw6RCTbpzAACYkhV+rLlvUMUDXpqRj8zAJ9E5w2BOYVOXMTjjxjHvLBGjZYUp+JphzkHHmLC7
	g8qK+ovHdp7+4GOW2ChrFIh3HEIypHZ+BZRstleBk5zbo25H5nTvzSItXnSDWLDjDpX7LNZTqL1v7
	IGcQAl9ts3I1/DbHAv0uBZPh6pbWqIQhiMW9q7ClsDxDQtv5O7PKIoDNlItJEtaodkMxxIYKpYxqo
	pNFtI8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsS1C-00000009Mdo-2sO5;
	Wed, 12 Mar 2025 19:45:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRy0-00000009MDC-3EZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741808530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=;
	b=f+Zu8pA4/FRkSbVl2xhZsIEOR3NNepXplVpCr95wM+VnjdegE57RWVLo1EGbYICF0L2ViQ
	akSWyEzhKZCZDi9CbpCWnZiGCCOCoXlg3yXmt5ApJ1XBSqrmUCAu0wfSLpTOVXuficzH0P
	7DI5w4/2psPUl7yDBX99Nms4z2UE2cs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589--fcSOp2WODmaL2J51HfeDA-1; Wed, 12 Mar 2025 15:40:38 -0400
X-MC-Unique: -fcSOp2WODmaL2J51HfeDA-1
X-Mimecast-MFC-AGG-ID: -fcSOp2WODmaL2J51HfeDA_1741808438
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so26377985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 12:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808438; x=1742413238;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=;
        b=nsPNY5yernPYBANMn7TFrx7vCcC1RBdjLgH7RFAjE0rU1TBxFQtUD4IsjI4mk2RkSs
         UWNe9TUKh3xNIPrjXeeH1mCGjtdcaYB0Fw8yX144q6VlJtrqa9ClXW8TuoruDsUnPxqb
         GzWUcePBTF42uhXJeGKz7mHvsK/B86ngoewQHi8zNFiWMAlI0Z34T8qQAF2UM+Pn51VI
         NpMEpT/OfBFzRHjLpAnkxBzMG2/4ppiCJ93VdzqsdNYcgimciarXRKJiPfhLRD0XK+DH
         4lDjtuJe3yWBQpPjJvYdMClsIP1PppUK0T16R3vocdWXjEHxBFwb/P4UQy47shKAurD4
         Lfrw==
X-Forwarded-Encrypted: i=1; AJvYcCWhVNxyt+8sMXZaCZTjCGgSUiHXdQn2jpCj8dLopUTcGdhHBraOdc2wATGcF+yq6pWarnrOb3TD3eSAK10iFyJd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkj+Y0pAoxtwtAoWvT8yxT7qcrgq7UW08+Z+lhwN7GNdGWTwad
	Io2ZIotKn8xynUUNFvMhWjrF7jS2yhktT0JXdUHZ8U8mzozc0yeFihQ28DC986/CLc+AX8cwr1E
	jWjmo9+MSUYY2w4HcsTM3mp9ZW6HNhb77LJfTBLD1dIvreyKNJCwlbvjvCuItrugT8t3zprcw
X-Gm-Gg: ASbGnctBG3bBFjg/rU5z8RGw90nQ2zC7V/UzZISksyUXV7WbB1klF4i47WjkvlILxHF
	BtKM94V+vQbHZ0AIFpyG0QPwZ+oaj3gNxZO9aCg9dmjPCbgtD5sI7yBD2QmGIspQwvtIOrdDkVm
	H3waD+5F8htY2dU4fj7I6+re+3Qv+DgZv+9a6iDNbtGZ/vVPa/vRlH5MwwKqIogmhC1L2AhXTUc
	QxyCYOHR4kWIqEXW4rrB7mIm63WAAj3vswYP078RHjs8nUiafEnokRswYFhweoO4V8tuPq7sxPs
	xIpHi2J0qFahXPMp4WUZkS6RRfVf4lH5ylVWmVg=
X-Received: by 2002:a05:620a:271c:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5544e2e11mr1931051285a.57.1741808438027;
        Wed, 12 Mar 2025 12:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFtjXSl18V3cVDW3uvVcF7AOwZPDm8P35ziMG/2MMADWgaMpNEr9E4j/T7ipIz220mu+4PBA==
X-Received: by 2002:a05:620a:271c:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5544e2e11mr1931048685a.57.1741808437783;
        Wed, 12 Mar 2025 12:40:37 -0700 (PDT)
Received: from x1 (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5568480d8sm476215785a.91.2025.03.12.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:40:36 -0700 (PDT)
Date: Wed, 12 Mar 2025 15:40:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <Z9HjMyjzE9XlqrEj@x1>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
 <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
 <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5DLQX6-qzovpOODrptDZebCaQIW-wGqPkqelpEA4-hA_1741808438
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_124212_904766_5E20562D 
X-CRM114-Status: GOOD (  12.91  )
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

Hi Christopher,

On Wed, Mar 12, 2025 at 12:10:56PM +0100, Christopher Obbard wrote:
> For reference, I am working on updating initramfs generation tools in
> Debian/Fedora to include the required interconnect modules. Currently
> the interconnect drivers are built as modules in these distros, but
> are not included in the initrd. That is where my confusion initially
> stemmed from.

From a Fedora and centos-stream-9/10 perspective, we have dracut
updated so that the interconnect modules are included in the initramfs
by default.

https://github.com/dracutdevs/dracut/blob/master/modules.d/90kernel-modules/module-setup.sh#L74

Let me know if you are seeing a specific issue with the initramfs on
Fedora and I can help you.

We also configured all of the QC pinctrl drivers to be modules in
Fedora, and this causes a large number of probe deferrals on boot up.
One of the boots I measured was about a half second:

https://lore.kernel.org/linux-embedded/Z6J3WpeJKIKENC81@x13s/

Everything eventually loads and works as expected though. The upstream
defconfig configures most of the pinctrl drivers to be built in for
Qualcomm.

Brian


