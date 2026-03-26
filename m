Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FB1106F309
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=; b=cWbySw5cKxT/gOG3vdfIOf+Pbh
	cCTOyNUkK5C8XSNYp2CoLF12ndCIwncsZ8znYd7PHXMxz8Wy5TFdXQtJajBbv3RIlG+pTN2uCPeRM
	jugHnqHsRvo7W3A9YVQGHZG4xxuRvKVv8nSJE87nTa40Hl/05O3a1XDhNDeyVREeAJojwf4Jq27Uk
	42ceOY20xl/t2+L+tlyGtPAqvBDXoiIqHNkz93kFVszIng7siAFXSHIWJrWW5ca9mK/heTDsD04lR
	+qBmvfo1aCTXsbHMrrXo/bBsmOHyT6eKOdnwChf+9h/rsMBtk/8ZhAoNXibldJHbcXQrd6QQTG3a+
	1vB+3f0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gg3-000000056MP-31ND;
	Thu, 26 Mar 2026 09:06:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfp-000000056F1-0zHV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=; b=eEci6kX2zjN/0dK6iw20ErjsSF
	RhBM/LURZGr52f/5RyRFPGJACs5q24T/tZTQZ882Kqj4Tkunyvlsii95agdrw+FfdlA3gD6+S8L/w
	Y6vT2CzUjydKs01/uXMOTVXnF8XLZwz5bmPHm3MOo5EeyDvGDH3EnFcbFeM29Bn2rjU3NZG1yZ2tc
	NbIhIyRkwjFSt+w1pxN94s6ohieA6/Wxdn34pZmJ5wSc7EtGSArlTo9xdzQ6gsWumLrpjZ1xCpXb0
	OY7IeMyb3xatp/Es3tFCjx03U95eFKFB7tZNimFK6tRBPRMLJOo3Ufus/mnvfwZ5H2gp4ET2xRrmu
	JwphkE3g==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfl-00000007pvI-2q7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6284545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515996; x=1775120796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=Zh5BdGoJee5emS0nT3gH4zNTE2egALy4xc1bxkwFBmzxz1IVkgCEzOVmrX7RN0QxVN
         /GmDymTjR6RLKtaWBPh6euvdD6nFyCLJt4aC4bN9n3c7wL7bbL8df0swb2TAzz6G8OEi
         9W8lTAMF7aihVasX+jP50Dt/E92X/U/xMKvrz3nGN09xrs0gSdjZxNQR0Y77yijE/aUd
         qWi5BBFgca1c+AOb3uAuxhhi4UeVX3dTm/bX0F6jBwQ0f2bpcOTHzwKad0722493z7S2
         ZBD2gTKsguFI62+CHilIu7SB8FKdn7FakypHDwC7icPAECP4sV6F8Gqawl+zdi/+ZrOB
         vHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515996; x=1775120796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=Rq9G/LTXASW2OxRInhaZOzNVRhBka+izMpJlc9nTa+fMoivlrqepDJYIbdoQkrc9VH
         UBJqth4//1b7T203PitTqUBASVGb3jcyARpsZIeqAXt+BqqlqfQ1AxUIxovnoX2yXEHN
         Pc2yYVijX90K0J65lhV48JH0EHBLwHCpR5Zio9Kb6xJorCv6ERl1BiBL4IFxA7M/h7rH
         yxGUZekuhyjj3Cixe6khtpQ8ruFkTS9wkooQcKv/kmn6R0hwCmsks0V8rdgkpSU0BPOZ
         yGNXn/KoJwa4hdSK3A0bDoAUIRDS4q0F/Zl4SqOPX/nJxXIZsiANU4i9VV5gLtzimG7z
         vIXA==
X-Forwarded-Encrypted: i=1; AJvYcCXgp2TXoVWBCw29CvUj092O+TPnUuSnjYw42Rjm/xu0jaxQBHgv6J3tJqhAf+CYxSsv0/2qWL5K8QDS12QRhx/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaLI7O4IDaDhi96kQZ0RE2LsSXsLgwSX5f17XhDoc6rkMGttZ
	fYng0YT9TdQR15k9V83wdxnak0+DaKOZxGQGq2H1P4W/1ohQOAo8wwuvodFLk0I3rVk=
X-Gm-Gg: ATEYQzwsNgHOHtWDaYlNVPpMF4zRf20r46pi24usC4IHP5xBhMLQlEjiv7ueHj2cd/V
	Erwn2OUqWn+gY3Qm6v7hSELQ5156su9Cq/NO4AObuJ6EUJ5RMHgPMuMKzBPVgdp9M5HeYsfmhyB
	3e3EVqORIPaN8aPIj3J6Dj4ID5ps8RI8dRXcY+Yy0bzZRu+KMY1aC4hiAI4ORBV/cZMBXNGHO59
	dUO2jTkTwEIX24mQpaIBsJcamgEL8HcXb8NgAVW0PdStldXzYp1f4g6lUd+i1GwAJ3nj6MoED3f
	4yyEgZr1g3TR8Yxvoz+UxkFW9UVVm/KrWxmwYI6aoSoPiX4zpos7k92vots6CYA8C4cuHAeBdAE
	9tonTlTlWl8co8rxFXv0mOjWMBPf0V07HQCO3TBL5Tr1D/BiSWww9q1pM935O5CgXQ3Dsmqcxtz
	4S6fZi8xY/9EZaKOhRYCO9KcVppVlpIM9zKsSJaB6ffvM8
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr93976505e9.33.1774515995951;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Jun Yan <jerrysteve1101@gmail.com>
Cc: martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, 
 khilman@baylibre.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, yangxuan8282@gmail.com
In-Reply-To: <20260213073810.552341-1-jerrysteve1101@gmail.com>
References: <20260213073810.552341-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add
 bluetooth node
Message-Id: <177451599509.122020.4339182739490184296.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090637_773284_34C57E3A 
X-CRM114-Status: GOOD (  11.59  )
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

On Fri, 13 Feb 2026 15:38:10 +0800, Jun Yan wrote:
> The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
> interface connected to uart_A.
> 
> Add the required device tree node to enable proper functionality.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
      https://git.kernel.org/amlogic/c/d6df314c0165cb809d6c647a593664a4f5028230

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


