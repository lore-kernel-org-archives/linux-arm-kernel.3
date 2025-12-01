Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3C9D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=; b=x4mo6mappVAeh3ScC/ILG/IZpK
	U00SrgUymjXBM9F+jiCaEJxsE0TRVN1Qq1PkmdvndgRrWLNq0UbeSAwqh3nrOiKqdo1n/i5blj6rP
	4TqNdqErj/c6MH92GFwb+fjoFdJGPYdGWqcuTGUn5P3gxzAhl2//vLFX8DUapoAqO+avYCRxPVjIk
	+nTfpP45vtUq/q/hOH5fCuKc8pa5qb/dJ45/M9/tfFLzJuNHTOH1XN/b08JXhfwJA29rOqbYqeYkJ
	l6yga1nRzCaSst9/atZU4vgszSEd0/FELOwUH/qlJb9xtlGl0TwWUXdxPkSYRcmyqM2o4r3BVQ39R
	EMRWKzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzlK-00000003AwW-0gcy;
	Mon, 01 Dec 2025 09:00:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzlH-00000003Av3-2mk3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:00:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so849779f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764579598; x=1765184398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=;
        b=XlaJN3DhTzxBj2pqg3I4wXU9lFiUzKILlmV9/V/9sWxNXeJMZE5aZ6aDs1/SWQbIQY
         PdNs4R49KvqG09LG9JxJ+unZ4jyeRKmWz+hogo/QtCclWInG9l8s15MKHrinEJCMRTh2
         wC022XQHIu+tbkWx64o1Ve/baF/zbm8hm+K7iJ9ejHL+lMicZj6bVHXl3NgsMZNlMwDn
         H28f6lvah3J6IV4XtT40rxBCNdPBS5iO7SvkbMAk71Sl87wWylCrG8+b4akBT3MK83aM
         LDLxNJ5yY8k3EdDm8IetUNxp+6AMPayCdGR84GduNS8vVJgvBYmw8rf0/XVOF+NW2tvf
         F+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764579598; x=1765184398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=;
        b=ZlPtg8TEsqUEPS/Fu9RPFPuLlEXqY6GaQWVVpxs42t73sSddPIxzVK36K4E6OQeNm/
         5pvGxorEr/ezyy0+u+Ate1X3C1LNIEpjcdXSjVDNGNVBQFy73eT8lEVFlp4t8nY1K2WG
         Hr6g5RjHek4pfona/gQ1ZxvIm4iaHukpliqlyAJuLOGFHRACaXE2KuEEx/L8mV0c/Puv
         1lHcHeWPXnj7I7lKttYGPHQ8k3Us1PWzavvRwyo0CqUFN5sLEU733xw3OUlScKi+OMRX
         osRk81aBHFivkQYB7+621+K1Syyi9HtAzhgi65XHLtunUlZEf2al1+MysozcdcmNA2Bn
         lp7g==
X-Forwarded-Encrypted: i=1; AJvYcCUp1XJUPiI7s1UOXBRf5sjpDD1kz/hkTwlG2ZiS7gPV5GqJB9bJbdmWT1JphxQcZCX6LSdlAkN8XO/YVysNS0GP@lists.infradead.org
X-Gm-Message-State: AOJu0YwuaFHCLfvWhcPA1k15+3j28O5FZqdtWs7cOGS3Zpkm8se7jiUk
	1EDVQXC/gquC/OqgY3ShZqY1StMkZtyt4D2BKmpVM9Y7N/d1YgGDaQ7g
X-Gm-Gg: ASbGncsu45/ocBndYzoV2ilTQF9+yCo3U3FwRvOqFakhBlrUMG0h1aJ3L5kAI0S9SgJ
	czp6gCz1JlJAluzVpzrXx8HGeTBWKuio2lWFE99pggAOuWqBbhYFoXaI8kwcMq4O+PbWHUP1ADJ
	udAj7RfgrqR6vDo8jHPSzEuXGHH8FoR0nW2UP+6X31k0Jx/KmwMYa1jdhNT7xFDugXdXUjDdpTP
	Uzr+xzvJMP6LkWjYNUbAy7RLl/IxUrD0pix/Ikw7VXTe33HAqmVnCbZjHrNCg1ocTdpxEumuv3o
	d12bULWupIEnbt2vCN7SkTXmWO2qIEDH/yngLAjcUTzN+jaE5Liid9cfJxV3ygST4jr9o88kkqE
	kiUziMenfJdCTg88oyqVJ9zYDeKzU4u/UtwlTXCENj4oQnTJft4kOuSLIwQgp5lP8348pX3zcyE
	fQaa5MLUQx5fRH513pQygrXDRPbRk=
X-Google-Smtp-Source: AGHT+IEOa736pXo0/WJD4acqB/BdSl155lhGxRAO7bq/cz6pjE/kshkcCp3gRvHiSfviAaM/CB44pQ==
X-Received: by 2002:a05:6000:200c:b0:42b:4139:579e with SMTP id ffacd0b85a97d-42cc1d1983fmr38638725f8f.43.1764579597732;
        Mon, 01 Dec 2025 00:59:57 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cab9af3sm24362786f8f.41.2025.12.01.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:59:57 -0800 (PST)
Date: Mon, 1 Dec 2025 09:59:55 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
Message-ID: <aS1ZCy2G03zZLH6D@owl5>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-2-bisson.gary@gmail.com>
 <f9e30721-a636-41dc-93ab-ca960e0415ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e30721-a636-41dc-93ab-ca960e0415ab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_005959_716189_C265927C 
X-CRM114-Status: GOOD (  20.77  )
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

Hi,

On Mon, Dec 01, 2025 at 09:50:07AM +0100, Krzysztof Kozlowski wrote:
> On 01/12/2025 09:41, Gary Bisson wrote:
> > Ezurio is the new name of Laird Connectivity after it acquired Boundary
> > Devices.
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Cc: robh@kernel.org
> > Cc: krzk+dt@kernel.org
> 
> Why only two of us? Please don't work on old kernels, some ancient code.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

Actually I'm using master so the get_maintainer.pl output is fine, just
wasn't using b4 and addding the CC myself, will resend with b4 and will
update the patches per your review.

> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the quick review of the series.

Regards,
Gary

