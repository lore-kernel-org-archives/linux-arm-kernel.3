Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730F2C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QVoUfdHdJ48HnCFe+0ux01ldLUN4WiVyX0euOzInBM=; b=yCeoxtxlTYSi2qzRx9UnzppnJl
	al1Zqk6/1v54mOE3pADjr42j66aPsVBBrsUHdoFWcKFr+aZGbxVlrUsiu1As9r5APZeHw2goqOSgb
	6s91t89oeg1lCGyr51hax2o0qRTqiwgo8TUDWkfZW8XS9UJVM/EI1w4tkkoKXPHIbXPgUGkhxcoU9
	fL6jkSyy9LiGAZ/6HpDEevXm032ggtvPytbXeZ7soeyae0B8zEdQ/9yTNWh2efjRIZ+s2g2XDJ8Tb
	BPO423DyWYHkY3spBHWmVq7q5+lN1C9uDQ/VRf3u/7O4vxE8dJA2/3Tv/ZsLyV91HtFRq+qeATbCY
	5/fKf5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqw-00000007zTT-1XiZ;
	Tue, 17 Jun 2025 17:12:06 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYhc-00000007oY3-13O6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 15:58:25 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c5f720c717so740487085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750175903; x=1750780703; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QVoUfdHdJ48HnCFe+0ux01ldLUN4WiVyX0euOzInBM=;
        b=dEDddIjctkbRZTvztrAgzbTCzYStEoOP/m6vD6nEIgkQl3CsMFNfB6pdW/itWcDR0H
         7JxX3mfyLdC9WBHz/sjYrP1COnzzMeJ18Ry2VBYaKxprEZbr/22c2eO+4rfUPBqbU5o6
         uy33U5fW59SfCUleGmopiubw3WFy+5RgdvRuX9nB1MIs1p8UkmutHqS6pqcingGnPPI1
         Aj/03ibQsxWKFcSBhSiW98UcICmQ/erPg311hM+cCHGyVS05omTKImtRTOATWxyQVxzB
         R/BKpmhxPKX1U2csxUoMQlUsh/NupR7RtBkI43ntSWfwPdCbSmxV3DteAWOVYhVXhXH1
         TTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175903; x=1750780703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QVoUfdHdJ48HnCFe+0ux01ldLUN4WiVyX0euOzInBM=;
        b=urS+3B207eoTo1xW0UWj0JTww2WflEljNxsV3dP+5WzP40IlzmB080mFyVWGjMInrY
         D9vTLOUK6yF6bwtNZAKsQ08Hr4hsyHUIcUxMC40yZL7D7AatANwMIOnA1yPw/dD77eJW
         D9ZJcc81xpO+XY9vJcRUeR+auwa0B1JqGqsnG1Hege8Q+YwhlyThvI/wAeO791u60giu
         dE5eHreeSM6J8OEpErIliTJ8JJqdwdMnDnuF2yZbT56bm+a8rxAK5Qf92uGQTJuzjlje
         AIVdHsprI7e0Y2bW1tgbO7sT+EvlEiyLXfe29xgfxr1Vu7kpl1xtxiEFr/vS5lzxuf+p
         s0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVVsFRYeVEO2+9RpMK8tPM+PCX7kto9rl5tOTE6+qKOw3frtcIvHJhNPbG7RBiSi+/9PvDAxG0mz5+eITxuTM13@lists.infradead.org
X-Gm-Message-State: AOJu0YyafQio93zY0eJUMzkdOudsdXnk+VmOztv3VgumFjNPIresPAgX
	YwSsBqLYjIa+ql+JyTjIS0wGFmgQgGfwKY3EE7PJPfp9EOdXvF6mEjwuj6RdD36C/Ds=
X-Gm-Gg: ASbGncuNS1KoKgaIzNYd2Gp0UawlHmbycU7skUjkwcD7X57w5/rY/9sqUKv81lDwDVF
	mHlQn4AQunD6IK9lihjCVz5fpHbveTvUnopUGNcPWbexkQimvNh8+vsBHA3szPxmNyM2Zg3roSo
	j/aDVrUNoa56ZJSjemX0tIFrh6pLCJuoOwx995PYQ3nmg+p5gUb2noSS42Hxn6bsGtGFr7/+85w
	Rp/kUYpBUtCiCdk4Z8BVLa8hvZfiwr2wKodYlyGoSS+t/jlfJDStp+F8bgG7f9PkavCPzUgXke/
	8ZnB2bC/8NBHlYfVYV9RCxt8cxFEouIQP6Nc8uiKILjj0GtlNJKut+nZ8QYymAjxEiS4u6bnjSk
	FLy/FiTr6w05PEB2iXcgAUtY2RjXHgprSAXu5FA==
X-Google-Smtp-Source: AGHT+IGQBUFbF+tPc3zGviUG0wR17BWPg+rb3PkSRtQpO74uvfm4fcaKBtbG84+832ByxCugbO/j+w==
X-Received: by 2002:a05:620a:44c5:b0:7d3:d14a:38aa with SMTP id af79cd13be357-7d3e07649b8mr472642785a.16.1750175903195;
        Tue, 17 Jun 2025 08:58:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e0535csm664773285a.41.2025.06.17.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:58:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRYha-00000006Wgi-0qrY;
	Tue, 17 Jun 2025 12:58:22 -0300
Date: Tue, 17 Jun 2025 12:58:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a
 frame
Message-ID: <20250617155822.GE1376515@ziepe.ca>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-6-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-6-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_085824_315516_437AF84B 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, Jun 16, 2025 at 04:55:53PM +0200, Benjamin Gaignard wrote:
> Flush the IOMMU mapping before decoding a frame to ensure that all memory
> translations are properly applied.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This is a really big red flag.

iommu translations are supposed to be controlled by the iommu driver
and should be flushed as part of the iommu map/unmap flows. It should
never be necessary to do something like this.

Jason

