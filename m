Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E721077617
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=; b=KLR9JbdO5t75MYZu3lf8/cgHQa
	BezyGn9zpbzaDvxxW8dKqHJiMY/WW0QYCnwygVqkWz07kXLmIleISc21X1lazuS7GZ8gw2v1nBELm
	96IijcWZwwU3NdHB/DSjoa482BgAEAspXQCFjn9ff/xymI7VTJn4EuM9NTh4xMaOqAL9yMoqplBfu
	aqyME3Nhhl5tVvjb/G5Hhodt55n/wj6y7l2cmCP/+zmfKNUROa/09wiYaL9+kkSTk7l7EVhi8qth8
	r5HbTEkjT767DfzPaAGag3VMSuuwl2IfIDkdNubTKrhIIUlJj5TE2EF5vgL/JMuH7t6StlvNnp/+1
	y705Z/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xRy-00000009IPu-1bTx;
	Wed, 18 Mar 2026 20:25:06 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xRw-00000009IPN-1T57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:25:05 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c73f107789cso74835a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773865503; x=1774470303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=;
        b=lc7uEOU1mp7KLe+WdMepdKzx+qRQUtnjOANY3qoU4ZYpFkdNI1EGSImgIYo0gOtM9c
         HiKnmCAf13FuSZXXc5YeHUS/27c3nrzy9PWieLSg422NI/3V6cwVjma/UJYOREucRnU8
         weEmv4qusJCSLYlCXeYxqOmYLbnbfGFbvwnnhu1YLvhxLVNP2IMrMocuclfGZ8uw25QW
         3PFVIxmfhDUInjeWGdsikzo/4XyPjSffBjcgtc4WYNx3HiKZRted6m63C968hvCID/7S
         SmaROJifxO4HpAEv2XOX757zBFaw8OgyX46Csc5VanWQkKv3aflCJ721QyFisBm3my0g
         JU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865503; x=1774470303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c7Z1vNAla1UqiQqigVemwFAmDse4jQT/gO6OkNgIBY=;
        b=rGKqS0DhsZIHdyyQURXC1fzxiOCioJWthwyjlvKj8QWBS2GufgYn9dTwM6ONOWqnC8
         FPS7WJ279UhLyVFor9YouKI/zCtYhQbb9cC8R2m8eEakhqWMgZQtv88YGyCtyBzeQ3Jg
         Nt5N8GcNgC1GjB4NpUA9rpmqnI2vKXIjGXCMxzpHwfTJR7gzLWx5BevKHnmy2ASgyCI1
         F2ZOuW9fWG2Aejg0Bmtbj2qIAVwtW8TE92vGIz0cpTZ+O/allobPrja80opcn4gP3qZC
         FWSupS1fzreQ536JSoyJWfHfwvkCSV0ytf7xA/w63zeDs6ggYExj3eoXSbcUZx9Wg+Cd
         A0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSRrR643Fa6KP6YLdqY4C7bA7/iHWeRXQQlhHFtVZIEBngZKH9ZLFTphbFlJIflP3EL+QRdo9wTSw2eikRM+hP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr07YfcTXDa2mEYqaX6XLe9xm3avdbRiNbWQxCKQEv+mNRsDEX
	+Vl8JT93xaOlCohvoazHHhWPWVa01nu1vjWCbE1a9u0b+G/eswaoXlVu
X-Gm-Gg: ATEYQzwY0Kc3yeBCddFFhdJZBKq/nnkTC7B7Fcd81+UmvFTmdtT1RmucHvaG+3Iaa+d
	BlKEQ5EZ2IndvODeCunWvS+IzglgirJ0dEaVWOxij2UYrpNctrG1Xf0fn4e19OvhLgcgX8ugO6/
	jBTs++ftLn8azLJwpARA+fXbY3LYqnEkM5vVYAT/7B5HjPPgisRKYpL170Z1MjCbNm8t4yE/IDS
	RwXjcFcyq58sfUVNKQrwyLaWv6UgkMzkaPr+RCsvNiHUtjQVoagkkZgVL8Favnr5RGq75gqNp1S
	voA7vIZ1n/ZY54akmvPhPUhvizkKw38htO9ll97YAccK7esTqQUqZ2Aeg113wQffMChBfR4nCof
	lqPuCzZE4A5DYFGKhAgahXTli8Q1FeqvLn4yXXqlrEzt4TuLwy61QUm+/4xDLU3PdnJrwWfzj3d
	OWqVmcvSvOPkue9seFBc4z+1CE7zTq9+bvtqN4OT4zREvP
X-Received: by 2002:a05:6a20:7f90:b0:38e:9220:ebbe with SMTP id adf61e73a8af0-39b99d6f450mr4339851637.23.1773865503486;
        Wed, 18 Mar 2026 13:25:03 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5691b8sm3286559a12.25.2026.03.18.13.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:25:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 04:24:56 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add nuvoton,npcm750-otp
Message-ID: <absKGJbrWX5xtPX3@google.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
 <20260318193538.246853-2-visitorckw@gmail.com>
 <228943f2-8f1a-4da7-8663-7f17f5e2f21c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <228943f2-8f1a-4da7-8663-7f17f5e2f21c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_132504_424320_AD6EE56C 
X-CRM114-Status: GOOD (  13.28  )
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

Hi Krzysztof,

On Wed, Mar 18, 2026 at 09:17:19PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 20:35, Kuan-Wei Chiu wrote:
> > +maintainers:
> > +  - Kuan-Wei Chiu <visitorckw@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm750-key-storage
> > +      - nuvoton,npcm750-fuse-array
> 
> Your driver says these are exactly the same devices, so you got only one
> compatible. Otherwise explain in commit msg why these are different
> (current message speaks about purpose, but is not what is needed here).
> 
Thanks for the prompt review.

I will drop the content-specific compatible strings and unify them into
a single "nuvoton,npcm750-otp" in the upcoming v2 series.

Regards,
Kuan-Wei

