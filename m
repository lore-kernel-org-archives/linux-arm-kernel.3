Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ABFC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=; b=w7iVQCDGMSXXtn+1EgSQE1BrmA
	te8E2ECt94ZZEFFv3fZYN+aoIpPS2wV4K/nTzScKvdDXfiUspggULHbLfkdmWpoJ1pxTrbup3oduh
	LfSRD8FAd2ZINeEjlb/1e5T2gdVXhU7Va+W3Kd9wS+3nGFWu5rP2PuuhN0QFUc1J4iQJN2QAj26vn
	o9oy8/bkdA0ra0yQRKaISfyXM7fRbcUryPYhAsYwkikpFybBKt/+SMoYFQ6bXetJwYwR58Xow+jOZ
	4DJMnCdWGNeTTFCB1bgs2rceqrX2GWyQ7b9O1WD/++Daml358+6rhS16Obh6aA3OC21QDsLIhwTKK
	7l2yO19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsuL-00000005RZH-1nV4;
	Wed, 02 Apr 2025 07:53:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsqq-00000005QqU-1ixZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:49:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11260625a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580171; x=1744184971; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=tnXGLXAeLkJTOshxynfoQ4yD1nMUg3XXTKIemP6bTOfXJoEp6Z5eqjzUXe2DIhrcUt
         +zIBMOXWffaxCP2AIowanzECVpLW2j6yr1eo7hDiZoBBCV2+bVUq6z7rJn4PTRa2bN3S
         49p7mQATCHxftwXCXzp90TcQOTTIwnxXgphS6VeQLMlSFBadkNSJLSxRCWqJ5RUl+NBl
         5C/Uh0hM/0pXFqNyNYYUaWPuQd7GoPSqj4pqS+sxAJHrGIPXiGl8BSC5CC2bO1iRqGB7
         uVxGo52QYneX6lzyJxigBXRXg3Qoh+pJRtLbbpBcu/2oCt+H9oWtVxyM84jSZWgfn+kY
         CRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580171; x=1744184971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=pM+Mcnk0Ie0xsDTM4+CArZzHJB5Cii1WpxHvn9ceRtAAmCZXNOO6hjfNoo0rSJ1ERn
         KQ5bEc4CMHRAmD/MyYiArkVEXUPmc+HWRuE30hR9+zWUwvmwy5PcyofFyM1ZqfTVfxmz
         RfhnS3kfaMvt+yef84T03PhvON3bLrkBuPrOcmNnWvIrDWhsoB6u9WZt3y8l8ES+gOfL
         UvI4T7q+wqt7BN3mU0chQfEu608YWXnQfV4JOMEjwHUAJSw57DyrETDAhClC/8AS6rM9
         CVro5Tc9s3D9mFfU0xAowzfniQ29lWCifN6CsWbZyKt88BdfCIKLUQLPgXqI2HOpBey8
         +n8A==
X-Forwarded-Encrypted: i=1; AJvYcCU3s2h9TnZYKc46EI9lxHNnEnrF/PVsjN4aeQHwtn0LYmaSsifDk5wcJUnZCPviwMYf8i0VpkUwHoqVYTsjEvt4@lists.infradead.org
X-Gm-Message-State: AOJu0YyAMM8bNVbQ77c7MqYVai/0BM8w8svDoX8HkBJNoQaDWJCo4lVS
	TMlIlB0Jvan4R3bVZ11u6vXvBlJRgkx2UevTiUntzgex5RlA3uVtvPjAM3wtxw==
X-Gm-Gg: ASbGncvqzBEWRw2DN1a7I00wpJh4xC9Olyg4eKpWCKQ4SLDjST3l7M+KlAI+Rj4ipRf
	UUvWGyCea4ZVN64ymveeXMVyRVZBn0UBPYF6kgOrkpqqnHx1uLgvFq0oFDxf1YKwSEtF2HrWitd
	fffXT4QJ3DjID+BrIuqt1ikELD0UYWFDTK64eK3M6AMuZtiCj7zEaZZN00BBlaR7xJBmdYcGcSd
	h4ogEmJ20fD0vftmfuNlUHraGk/86nPD5IVD2GjoqmfpbRsMd7wJpkTm+FSn6M47P37jzF54tqz
	yqjbxMItJ05A0Z0DxD6a1jzoO44Q9vWVnZfbSME1oJJH1BsqRnwWxc8K
X-Google-Smtp-Source: AGHT+IH8Jzdp+kwIVinSdsTnAiNYI68lWe6D/QP0YRmgVUgFc10NP2fNsve2H8szQGsEUFhU7VB1aA==
X-Received: by 2002:a17:90b:2b88:b0:2ff:62f3:5b31 with SMTP id 98e67ed59e1d1-3053216ddc9mr24513921a91.29.1743580171478;
        Wed, 02 Apr 2025 00:49:31 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f83ca51sm892730a91.13.2025.04.02.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:49:30 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:19:23 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Arthur Simchaev <Arthur.Simchaev@sandisk.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>, 
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"peter.wang@mediatek.com" <peter.wang@mediatek.com>, "minwoo.im@samsung.com" <minwoo.im@samsung.com>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bean Huo <beanhuo@micron.com>, 
	Keoseong Park <keosung.park@samsung.com>, Ziqi Chen <quic_ziqichen@quicinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Gwendal Grignou <gwendal@chromium.org>, 
	Eric Biggers <ebiggers@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Message-ID: <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_004932_451712_C9A296BF 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Mar 28, 2025 at 07:02:20AM -0700, Bart Van Assche wrote:
> On 3/27/25 5:45 PM, Bao D. Nguyen wrote:
> > Thanks Bart. How about we change the current utp_upiu_query_v4_0 to
> > 
> > struct utp_upiu_query_v4_0 {
> >          __u8 opcode;
> >          __u8 idn;
> >          __u8 index;
> >          __u8 selector;
> >          __u8 cmd_specifics[8];
> >          /* private: */
> >          __be32 reserved;
> > };
> > 
> > Depending on the opcode/transaction, the cmd_specifics[] can be type
> > casted to access the LENGTH, FLAG_VALUE, VALUE[0:63] fields of the QUERY
> > UPIU. The __u8 array[8] would also prevent the compiler padding to the
> > data.
> 
> Are there any user space applications that use the osf3/4/5/6/7 member
> names?

Yeah, we should be cautious in changing the uAPI header as it can break the
userspace applications. Annotating the members that need packed attribute seems
like the way forward to me.

Though, I'd like to understand which architecture has the alignment constraint
in this structure. Only if an architecture requires 8 byte alignment for __be32
would be a problem. That too only for osf7 and reserved. But I'm not aware of
such architectures in use.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

