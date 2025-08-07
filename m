Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7722C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDU4mUfLGa/kC/rD4398PtK/yjh8S6aRiKIZIanDiL0=; b=3VC3FgZuHV3egjLMIrJDyBiPys
	hg/cL4EZDucVYwYrciePB3LTfW8CO+RwD0mj3fA/G+hUH53HMSeAonO1BIgovlWX4DLmNnqve3gLA
	KGILB34Bwb3NzTYt3reoOEmk/MUTb/7D/6RHE+DCbvXxxdYPLs4Q2wboe7W2aA8s+CHyDPkeDmJv4
	We3GYNvaHTJ0POYQgfrJyJcUrwvoi0b/MHF5bwDL3PkGrVgWM/aHlhG6c3916hfqFHOTA3MFWXuPq
	rlHIa6xGVfKOT3gH1nVTF8lAwo+KtSMZ5ibOOT/d/7uG3q3N6WXTIk2jUBxZRQ153+m6O9oBToKln
	tKKFRntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvaY-0000000HXry-1hUM;
	Thu, 07 Aug 2025 08:03:02 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvWS-0000000HX9g-3ZXE;
	Thu, 07 Aug 2025 07:58:49 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70a57a8ffc3so6817397b3.0;
        Thu, 07 Aug 2025 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754553528; x=1755158328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDU4mUfLGa/kC/rD4398PtK/yjh8S6aRiKIZIanDiL0=;
        b=jXukStQVA7a0dluYjh5Enk9gp/Du4aRN7Q7FLkqaU9HOtrgTAjQC/kg+LBUj16tJ8J
         9L4gebhnLpDdNIf3wnVm5qcU+5ViMxdIlcQoeFZqKnE1rEIrp4r/xvXd1ie4HiZCjzNl
         SlO3H+yxdoD5oDwcCJEbX28a1sIqvDjt3KB+lPiqJcxmQIp1PJDT2qhzu2DEuar9U/9i
         PXkHOog0z28wSmCixCTHRs82mTbxVqE/2lLhetZ00u6B80AWM/WedYNSTR30Tiwmnj5j
         zWeGNjRwal7CVfRpIa6npswgKOEv1TBXW0GRvHmdtDFqCqTBOuQe3dZLWJJ2dEf2H+Ta
         xKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754553528; x=1755158328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDU4mUfLGa/kC/rD4398PtK/yjh8S6aRiKIZIanDiL0=;
        b=Puh4pcu5ExqpDydiWQsHvqjihHWLVFs5rpw/SIsO/InGwrlXi7N+1QxWGXfmRjo95H
         EgiDlGI6Gftm9Kq4cJnR7J5jIjFf/ZDzMTPGVVN2e/6+8DISrsNCTgq4vsUDFtjsBRI0
         gxvpg3KIccNSSeZ+8ordZfqb0rzbGDyNx7uVnc+mO734rvekT/0FjberEqdz6s3i4uRc
         7huTlN9kftIF3SpPGE1Iz9Z0kFAQKf5Qi9WA7w8x27t/PFeEaBJp5I9ot6RUB3f+7l++
         +XixhwVIyugmfGnZJCoIvYJU23rhS2qlSoIrWimqYF6/w3qNITNo/+lERubvijg4CddH
         hvBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTkhD3tszwE61uH+jrxw8qZGDRhd3yYRw/mS/O2G9rnP5ReTuV+4Yjv32GZ428YHhjyZrhxawKs2Mh@lists.infradead.org, AJvYcCVa1ARuuaMeOtdUusz+gmfSNXZ3NaaHrdVwhjstdBMIM6eEvaK+8P6vpMkPnyoudDXT19yLg+1qLqLlPp/WHWA=@lists.infradead.org, AJvYcCVwpdS1/R/WP9qVRLgdbsjHAJRE5bdEBl0b8N+lPPh5MUVX6//O/t609hXBFY9Oze1f8K/IYgDZ7A7PaTrvYkDm@lists.infradead.org
X-Gm-Message-State: AOJu0YwtVcn5Brq+LZg7K5nOWnEXgDmxpjvT5rfRyLFhaLENCj0FToIQ
	WpAYE3oY3TnPXsyFnzMxuLDUw7Iq7q+dnW6aIPlC+rxoANwLsIXvvhYwklA4tBQOxHKIt0Q5GaJ
	2GjwCXH3+YSVT0PKgmumaOU1AlRKPj7s=
X-Gm-Gg: ASbGncsxC040MC+3AWjZF7Gbd5tvLw/F6wt5HVMztDTwetAp3vIa1lK12qGSZhEUmW1
	oho80CxrJG4YON916HS5NPqDPQpkDWe2nvmUL7CrC8PcVJ5bdUzskN/4DlCzMopsjjm5SxDWf8l
	8cW/yTsMb8t4j2UI3mQaYXkfnPSG7QkIhATTTi/W1yktMMl7dmxo7ag3czQODNDvzoOm+h86Unb
	9hPPrstBpurc2Dz9GJtZsGR3S+7k8KK9MV0mcU=
X-Google-Smtp-Source: AGHT+IGZKz1tpSwZENVH7eq2lbQKS/ckKC1RJ5Elh7kv3TzcssZgVYBUSlfRHCr803DVDFTPFP0Xzi7enXaZL6INYzQ=
X-Received: by 2002:a05:690c:6d8b:b0:718:3b9f:f1f0 with SMTP id
 00721157ae682-71bc991cebdmr84514327b3.26.1754553527739; Thu, 07 Aug 2025
 00:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
 <20250806133824.525871-2-rick.wertenbroek@gmail.com> <20250807-amphibian-fanatic-muskrat-b1365b@kuoka>
 <7ea03b71-d36d-49a4-b848-34eba4c1620d@kernel.org>
In-Reply-To: <7ea03b71-d36d-49a4-b848-34eba4c1620d@kernel.org>
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
Date: Thu, 7 Aug 2025 09:58:11 +0200
X-Gm-Features: Ac12FXykZEwvQuAbP1opdqmWRhEGs-r5-vMCR-fxkqHt9AuoJgwdnEGvT3Iy_Qg
Message-ID: <CAAEEuhpZGbuGkAKRiYQouAwDwnJbP+9ppi7BtrZekKpp20iOgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: rockchip,pcie3-phy: add optional
 differential phy clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rick.wertenbroek@heig-vd.ch, dlemoal@kernel.org, 
	alberto.dassatti@heig-vd.ch, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_005848_895534_808925DF 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu, Aug 7, 2025 at 9:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/08/2025 09:42, Krzysztof Kozlowski wrote:
> > On Wed, Aug 06, 2025 at 03:38:21PM +0200, Rick Wertenbroek wrote:
> >> Both PHYs can use an alternate reference differential clock, add the c=
locks
> >
> > I do not see any changes in rockchip,rk3588-pcie3-phy, so your "both" i=
s
>
> I meant 3568, the other one.
>

By "both" I meant both PHYs of the RK3588 as the rk3588-pcie-phy is
actually a dual PHY (PHY0 and PHY1 which both can use independent
clocks).

The RK3588 PHY is a dual PHY with two independent PCIe 3.0 x2
interfaces (that can be combined into an x4 or used independently).
The RK3568 PHY is a single PHY with one PCIe 3.0 x2 interface.

The RK3568 already has the bindings for the extra differential clock
for its PHY, but the RK3588 did not, so I added them.

I should maybe rephrase this to make it clearer it applies only to the
RK3588 and that by both PHYs I mean RK3588 PHY0 and PHY1

> > either incorrect or ambiguous.
> >
> > ...
> >
> >> to the DT bindings
> >>
>
> Best regards,
> Krzysztof

