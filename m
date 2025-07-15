Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF098C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/N77NWhujGmD6BCrmWvWG9O24/CxYwoKzySg4bes38=; b=abLBjsxO5HhnW3zfxetMQSPNro
	IN+W8njtK5FCFZIazzDsqLRn8ERhMoSs10MmVX48jLhvx4gvod9AdQzq+UsI7/xjAPIHi0TZGEZAE
	FbBWPzWCkZrd1ADSDR7V6MVJgIR1aBLPOCRZEgSbAY7BdLvns3vPQ2jY/Gladoq8bO6qkcu1XsKNH
	j0Ht10vaSqMgEAgFHay9MfkqmI8qolqUqIPfz5KMx6fIlC+jF9U7m252rEWOx0vns91Zvwm4Vw3iF
	sxuElQ88youMIakPIAceGFON+EmpsOsd2nEAunpcOlkp05uTt3tJf46ADVeRvUv6GbGw+n6uLaqJ+
	p2Lpfv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXWm-000000042RJ-3mHN;
	Tue, 15 Jul 2025 04:44:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubX0G-00000003zC3-0zp7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:10:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so15183675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 21:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752552650; x=1753157450; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/N77NWhujGmD6BCrmWvWG9O24/CxYwoKzySg4bes38=;
        b=fYvDTKHMTPbg6vOiWYH0O2MXidLxGg32TGtJepoVQ7Nbpn8rcC8JebxYHei3HBxXWc
         c3wNC4Tw8zADkbR9A9LJs6lwulbwT5UJ0yr1yYEpvtVNLEiSYlddrJ9JGUQbqzwbM3xz
         d3v/X+EGnj/+30jbAyPH9dWW//EAJROXWixT5vrctD/aFPZ4Y0AkLp8JTgda4HvAyLem
         +Sgn+bou3uX64mDwL/E4Gq1IpCEIQ5Y4392ZzFt3XrnyJ/zlQ1L9+b83hP6CEbjO0AwX
         UzucqOmg0gmpnawoEo91O+FJcH/AL4Vk5lvdoIu4QHLeznRIxuqPnP/YZOGojZwOHor4
         9sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752552650; x=1753157450;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/N77NWhujGmD6BCrmWvWG9O24/CxYwoKzySg4bes38=;
        b=lI/a1Xl/NOz8jCXNvd4M0mQP9dMm5livK9dafgklCCvnIUYsR1Q1jnqnkn7+KllVyt
         l66ylii9GKr/B5423uGRfjfyBsBegfZUWPoZnlZx1y6NM3L4SLhPPZHPzhSIY9pl9ORm
         h+lNsIigGLDeUQ5dOEZ6TA0hK3mIDdeJD3u93TyMzh+3ykrVW64KprlQlxjeXyjZ0xV1
         aOO2jhGM6Ysu+QpqEytbCvP86YUl+gFBW39JXp2n6Lhg+8+kNwBsWdo5ZGMKMYSQzrSM
         brJGwKW5HQzJ+FjxClmsAem7PC50WJ+QcamsjlyY+qkyzswqAvfIqF72Pzpl1kE2jFbx
         CmpA==
X-Gm-Message-State: AOJu0YxGbrvwwQvpqSiMHfoEKtNdgI1BE+87Caa8l52+5l9cubVPgFIM
	mCUX5B9Yee2P3kj2r1AV/JVkNr1php0n/ubpSBrxc4ul1HNgf4olkYzrwsPojLyg9czkc3l6yUa
	sMoP2
X-Gm-Gg: ASbGnct5D2SdlXi/5BUbfQ9S5vr68cu2EqHAwzB0uRDZbXJCST+uErCJxmM+jSQ+Aj7
	zL+Nf/vSEcOxWqZ0NXT2i/kPJ0NLhu1+MrjsH1yrkMSD49HQSiHvOBbIo82sY/EShmysd/WHNx7
	LTXmSmivLy2PjNPYV4plBcZ0MJr8I0Lq/QDjasiuy+CFFL7UCZbbwSxNfhorK4rLE7N+1c9Eakp
	cXCPTCrCAaLaoipujl1kq7Nn46Xuq916h0LORgRrYqO1ejmFnmAer66SHMt7yBWQVYTng0U89c9
	cija7MxIPCNB2EtFBTkWLY8jJG/+amstwgv4hjo+s5AojgpNeUZDcu1e95OHuBJ50cRZxOvlK0a
	uG4nNgSBV5cQ87ts/BIYrMLar0ck2FBkCnO7p4NtwJ+YMF2De0A==
X-Google-Smtp-Source: AGHT+IGvcHSZDh9ZjzXQWSm9GBScOFQhnNwMoX+CCkuHiPctRXRfzwg0GlXRiOAgI5Ddff522EE/QQ==
X-Received: by 2002:a05:6000:2a85:b0:3a6:d296:feaf with SMTP id ffacd0b85a97d-3b5f188e9d1mr9916569f8f.24.1752552649887;
        Mon, 14 Jul 2025 21:10:49 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52cddesm11102271a12.6.2025.07.14.21.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:10:49 -0700 (PDT)
Message-ID: <e9ddcc05-e6db-49b0-aad6-c7873c38c427@suse.com>
Date: Tue, 15 Jul 2025 13:40:45 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
From: Qu Wenruo <wqu@suse.com>
Subject: PWM fan control not working with Rock5B and upstream kernel
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_211052_351880_923A5EE5 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

My Rock5B board is running edk-rk3588 firmware and (almost) upstream 
kernel (6.14.6 kernel from ArchlinuxARM), using upstream dtbs (the 
firmware is also switched to device-tree boot mode)

Before that I'm using ACPI mode thus no PMW support, but the firmware's 
fan control is working properly although running at a fixed rpm setting.

But after switching to the upstream kernel and device-tree mode, the pwm 
fan control never works.

`sensors` command detects the fan, and the pwm seems to properly 
following the temperature, but the physical fan just do not spin at all:

center_thermal-virtual-0
Adapter: Virtual device
temp1:        +80.4°C

bigcore2_thermal-virtual-0
Adapter: Virtual device
temp1:        +84.1°C

package_thermal-virtual-0
Adapter: Virtual device
temp1:        +81.3°C

pwmfan-isa-0000
Adapter: ISA adapter
pwm1:            128%  MANUAL CONTROL <<<

gpu_thermal-virtual-0
Adapter: Virtual device
temp1:        +79.5°C

littlecore_thermal-virtual-0
Adapter: Virtual device
temp1:        +82.2°C

bigcore0_thermal-virtual-0
Adapter: Virtual device
temp1:        +83.2°C


I'm wondering is this a bug in the upstream PWM code or something else 
is missing preventing the fan from working properly.

Thanks,
Qu

