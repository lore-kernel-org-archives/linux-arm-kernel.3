Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD6C104891D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrjLY/bl7kBvcwxLrBNZqDnyVSO3SRsmiAQG84aatrI=; b=G2X3On5FNmcvqnZvi1UWUia5JM
	RgdmFZo7RGhGvCmpINSEgMAzQs+OlToU+S62LF3DiLjO9w0uFmgAvhah2av2Su/BIjhDQZrOL47tQ
	xPfyNeiDVQH8n+WMIRSjgm6boZGmtG8vam2XDDy6aPukCRkw/nAGTkYNyDtsnmwNqS8V1mbANFZFu
	aP/RoPJKZ1WpaWGEucHoc5O+NVhmCkTRHz4RZObHq9cMaTD6PW+BzJ/Pzq2qO9hX2dVGifoOMkDBO
	oNQif6Q4LPrAtwPgd9bMuiFo187XMbiBopxyhi03PD55ZASQ/+6r3HxbsSAq2QmAKI0E286QIs/zV
	R6VCdACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6YE-00000009EjY-47V0;
	Fri, 27 Feb 2026 22:43:15 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6YD-00000009Eio-0YxD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 22:43:14 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5674f3e80edso2707192e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 14:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772232192; x=1772836992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrjLY/bl7kBvcwxLrBNZqDnyVSO3SRsmiAQG84aatrI=;
        b=Bx9Wr4YMeaj0Ezlf6bfw15u1oYeB/R5kL0a3NWijQrherFIb7snp49mdIA+s+WcFGo
         Sa5pbYwXVZw+pE/1DIiaQ+TCDnkfQVMOwFSyLRNQ6vDd4t+Yq+Emy8w2VYhxgDATOU6D
         OFSzKJ7qIqBles7mtaM3gOXkFUCx+wJjgbyYHyoIoPdESnwO5QdVbtIUr3JVLpM1x8C4
         dJdbZ2MDaa5Jb2OxobD3PZtUFrIfc0hoDLInY2/8UpCeVnqNLL+8w+04vnfpZ6lHlDmo
         n8pwofMCDM9CXYoWW4+nXqy996qnNONYEjbNZAwC3/EpS2JJsETWAxPfGJM7973jIuWm
         gthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772232192; x=1772836992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrjLY/bl7kBvcwxLrBNZqDnyVSO3SRsmiAQG84aatrI=;
        b=prIXKYosq8xOhLiyVzSHN0WfrDnXWmqDTzE1DXIL8uAzzzJWsa7omz+xqzTlJH70h1
         rkeXFA5+fVPcBzS2qz4Mz5F56pxn3znB/L3MCGCGq3y1SjpmVoDs/tNzj82ohCI5H4+0
         XHksUZqolOO76cvBfwbivXhnsMomG71rimuqPB+vixXayYWkRCPImOiqHe5flYUJ5eb8
         oOTqWaki3MSOP5cHb7SxeDN6CA8f+s0Anxq4iU/hyORES+f7yPptYEZwiNv5dr8R2wxg
         6Fvey4vP20xpjmdN8maQFfH6zda5bYrfisfHQwCZ77cPaYpZkGyeM3Joru6C+wFuiE/Q
         5fgw==
X-Forwarded-Encrypted: i=1; AJvYcCX4DC/dAg+s7hjg/XcEgFBrSHahEJHnnI9NgYIqkuhePpgKtejvA6+cnW97mcFFHmGgQktbAgTzKnGjwqxN/aLL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cUO0Dpc9hKdqnGmGBjKruOi0at/YlSMXdLqZSyiHLqo0s/Fl
	y5ldzRsuPae43cZzd1yRmBgw37hpiOh6WJy/H64gYyitPl4sFmzgpa3/
X-Gm-Gg: ATEYQzz7Us3VEt0aa09acuL9eVOoaY+Ox0hGmkS5i56oBmIm9zoZv44LMD8K3hQ9EgM
	9yeD+NhzfgVO1M+YY+tn4rNMNj8+65CshL57v5bA701yZhg1FfOarPTJhvxTb8OYdM77VgYAWfF
	y05cv/nRmF0Lu/Zwagxar5hg/TcIgGjDMNERfo8bABm5ety7q7ouu/U9Wmceeo3fQkjnUMyqkxV
	r4LXw2ktmj9G1uXS71r8jL4IIp3U8fp2T8bVDKnVDvsQdURn6jSrW80eoxcaO2XFWnw9pblWGlr
	vUZEW4Z0RKlyOts6QaN0LFpJASpoR+8Es24qttArierBNxJtFDIk4HUYzA5QIhQB/MUwse8j77f
	IlElV0IcAaBJSBmLgweviwwhdNmCtqURUPN5K9O/gZbdS0GUZNHdYtj5V19S5A+2+bCmOtxoeqm
	qKh13cr8FaHg==
X-Received: by 2002:a05:6102:e13:b0:5f9:39a6:3c13 with SMTP id ada2fe7eead31-5ff1cfc9d0amr5029522137.19.1772232191950;
        Fri, 27 Feb 2026 14:43:11 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df645b877sm5967626241.8.2026.02.27.14.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:43:11 -0800 (PST)
Date: Fri, 27 Feb 2026 19:43:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] PCI: rockchip-ep: do not attempt 5.0 GT/s
 retraining
Message-ID: <aaId-TU97Z8f5Mwy@geday>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
 <c51c804bea56d772a59fd29fcb080541b7a367d2.1772169998.git.geraldogabriel@gmail.com>
 <87zf4ujf5b.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf4ujf5b.fsf@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_144313_173880_77FDD0C9 
X-CRM114-Status: GOOD (  13.02  )
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

On Fri, Feb 27, 2026 at 05:00:03PM +0000, Charalampos Mitrodimas wrote:
> Geraldo Nascimento <geraldogabriel@gmail.com> writes:
> 
> > Drop the 5.0 GT/s Link Speed retraining code block from Rockchip PCIe
> > header definitions. The reason is that Shawn Lin from Rockchip has
> > reiterated that there may be danger of "catastrophic failure" in
> > using their PCIe with 5.0 GT/s speeds.
> 
> Patch body says "header definitions" but the change is to the drivers'
> source. Maybe you need to reword in a way that is clear as to what
> happened?
> 
> Cheers!

Indeed, I was the victim of reckless copy pasting here.

Will fix for v5.

Thanks,
Geraldo Nascimento

