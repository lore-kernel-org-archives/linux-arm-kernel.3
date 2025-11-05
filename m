Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E5BCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/FBmebtO0Vkrgh/mrFAUBv/BWvq5VVY9yGcMnDDP8s=; b=i7rHqIoD2z0vSSwKPYXQ9aJC/E
	RUcn2MmrhAvrLMT05sxjYJDHsaou6YiPUUCt8U9Tl8Vhb2fc7ts6lIF2sBfzBmul/ORWrZMJ/RUmk
	7k7hpWHtXWHRqbvDict1OkckE1V1xV6sE/IX4m0vPurIkHl0wqHpxLg2Yph3Cij0c5vnsvD/E5Wxj
	odH5z6Xwp6fM8AljcSz7TsK2skpOTMIVjfOhKGYEpCRUt6lI3SKS7+g7GPVO2hDwh9eJMA9Wir+Lf
	Ljky3GYAJSxsRK6exYU2H9t1Xe/0FySwP/aIqNcMcA04fS9eurFPskfZQZBr8bdbcIStdAw0ROjGh
	wFI2VZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkxL-0000000EVgT-3Bgk;
	Wed, 05 Nov 2025 21:22:15 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkxJ-0000000EVfe-40Uw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:22:15 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3c9991e6ad1so221643fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762377733; x=1762982533; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/FBmebtO0Vkrgh/mrFAUBv/BWvq5VVY9yGcMnDDP8s=;
        b=hTtVrYIPqEaeuDSwvXh7Xbhf9531fmC/TK2ewjO+pzn5Nu/99/PSvZMEUvg9ichsBH
         WWoyXsyx2MPl3Fo1Uf/svKj4JdErxwoZy8T7k32Lvl28NyESC/BP1g/Z16g0BR8mCOpf
         nRWnt5WMWRqBpv71znbSJevvf7O9r4gGX9Cb2FFU3BTc5hlWcPudBGWd8Fbxkd98Z43C
         DPrho4s9xDoUGYcprkXOuAct9CxAI54wbjx//XnQf1G/VPoLnjSqKMsrP6X2KDK6y7K7
         shtid73ltAjCxrGMUVDAZZRZFExSTh2dbE4H80IK5PW4gcZdLdNMt3wwcT0OksiVTiAg
         EWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377733; x=1762982533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/FBmebtO0Vkrgh/mrFAUBv/BWvq5VVY9yGcMnDDP8s=;
        b=uAwA58pUTKVVi7dlmz8hN/HkTeX+A62A7/bwpyuhCs1l7Wu710Zq01/ELPlJlF11aM
         eHfCR/EI1aiSQkq4ZdvK2e3aJJREMHgtHGATy9hK9voHLFbPc9VE4dgZ97VqtJDWHrmd
         /lwEV+wrT+uHtIqMpzwFZtSvcyAxQ4NaUC7LfQB8f2jRDQEdl3HCj3XIuw+Cm9M6Mhc7
         qtvky/ECuX4W33TdG2ClMkx8ViDfomEDOXmk3U8JtRfXJGJ8WAkfWmfZEuz+Pq7aGhQx
         um0391IDrknKDyPQua6tJumxXs2jKDBkZdjIN8oFomRLDLDFihgHsvtd6KI0y09+XG5K
         //+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+fVUon6TtP7Af4vnUE5me2bbzC0cjMq553woNOZkPHp5Y6JGOF7RKrIXhIpTM10erQml6cVOWgfyfYH0XnE3C@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDP1yW0Tp/8QuHOEn6HNa5xViK3G/dtA1H9ZLl3OBqy6tWN4e
	X68/mUh+kTWwP2u+AEkYepoiPxqbMkNqs/k11VR40o1zPoRQOKaP1bd3
X-Gm-Gg: ASbGncuiSIWAGnyH229fMWKMSQ86ovzV/Ff5i5as0iwBUfcuCifUDt1CJZ+n5mLfaJ0
	RoZc3UcGnGPOYdgtrzeFHfXXE8+xXcOycOPlRS5Vt/IP3E/QatMm0gA32iXGQCh3WM09mY54Bjk
	Fpx9KKn5+08wfix/rsGMX0vxlbF55YV4z6lMWLwLVbeVJvXj0o6N6qPPpTNZdvK5t/yF+GCTbiI
	PDtOnUKv1xowxh2UW13H1fd8vreujLe+ulUWHy+I+/UhlVqw2WTsD9N0rNID5QV+q2bQbz8zNYC
	z6545/iB6qzUKO9NSFv9NflgUZ1T8AMt7thX5ksIP42ULfGz2EGdGIb0c4VVQ0k/s1xE1YCH1Go
	FXjpaIzbFo1WvcGXUDPgryjZfW1B2kw+ne6ym0UXJtSC4lr5ANKAx5asSPH7AcXIjuRFvS4Bj6N
	Ex+6NeYppd
X-Google-Smtp-Source: AGHT+IH6bmLILBlZkClZJKGGVOQMJ8uDofSrhNGHs3xLSaav5plph/1k0YKtCJFMX/UFHGhYB7B7Sg==
X-Received: by 2002:a05:6870:1484:b0:3d2:e6a7:e938 with SMTP id 586e51a60fabf-3e2e3d8c98amr572130fac.15.1762377732693;
        Wed, 05 Nov 2025 13:22:12 -0800 (PST)
Received: from geday ([2804:7f2:800b:2ebb::dead:c001])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e30847fe83sm153392fac.6.2025.11.05.13.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:22:12 -0800 (PST)
Date: Wed, 5 Nov 2025 18:22:00 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <aQu_-JDy7qqeviUm@geday>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
 <20251103181038.GA1814635@bhelgaas>
 <aQrKtFT0ldc70gKj@geday>
 <DE0N4LA8MOJD.236O12UZ3I3C4@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DE0N4LA8MOJD.236O12UZ3I3C4@cknow-tech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_132214_025646_4149EF4A 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Nov 05, 2025 at 10:06:53AM +0100, Diederik de Haas wrote:
> I have a Samsung PM981 (without the 'a') and AFAICT it works fine.
> I had noticed that the PERST# (pinctrl) was missing, but 'ep-gpios'
> was/is new to me and I hadn't had time to research that properly yet.
> Good to see you already found it yourself :-)
> 
> Cheers,
>   Diederik

Hello Diederik,

Thanks for the heads up!

Would you mind testing the following DT change to make sure your PM981
continues to work fine?

Thank you,
Geraldo Nascimento

---

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index aa70776e898a..b3d19dce539f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -383,7 +383,7 @@ &pcie_phy {
 };
 
 &pcie0 {
-	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_SINGLE_ENDED)>;
 	num-lanes = <4>;
 	pinctrl-0 = <&pcie_clkreqnb_cpm>;
 	pinctrl-names = "default";

