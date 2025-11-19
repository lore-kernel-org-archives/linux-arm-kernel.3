Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5517CF34C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeQ7og2zIf2WaBP3fNWtUSnP+euy7z4uHI8eX0I9W/o=; b=UAQ2VrZAxILTojITnpxRVTyWH7
	yVmnF1muwIgGOUM2IlMJlKHbS5gPumK6VYC1c5cWOQOLNC0ADXsJ+dT5rZU8R+NKO6oDf/YGsgb+Y
	ga3rz49swzTRSqu9uGpjl+DI6fKWaRHeUCqknn9Oc/7tx8sz2fC5XKei7Y/T4k+hpYuPACJ0DekY6
	q/iQCLcLJg2V5p9f7+2Vb22IiqzCEpvDISvf1FSX5W0tccOFa04sZDUJcws/9mjRn93uxLuu7bmQo
	0GH8iMbWy+yo8im21DlEo2XafKoTjEPjsvqXP9V/jGn7omTb1AzGNgJqZh9WR5NrsCIW7cgAgs1Hg
	JC2DngRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTP-00000003POw-0Uwr;
	Wed, 19 Nov 2025 14:47:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTM-00000003PO8-1xI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:47:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477549b3082so56219295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563670; x=1764168470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeQ7og2zIf2WaBP3fNWtUSnP+euy7z4uHI8eX0I9W/o=;
        b=Rlav3yVjrvezV4aaUmj/pOMk2eXJGGLkIrilP2ft+0NsG9MsTGOOJu8GQaOcKUSTuv
         4T0qxVhCY8dc5NnWAdh5cugCo2K1vXwoSQEMeQ0a7T9POZ6+PxPufze+wJLfB3EHbvt4
         uQPk02mzqP+Geq9BV2Q2TnuctZjJ+6t9WUM44274CvDZ+bEeVA0j2pOHWkYFjeBI0UU0
         KlMscBuaAHVzxZW/PqnlcvCgUWv3D6iFDpXj+M9Kv4qe7ZKOzKsYfQ8l/sSJhSD2il9F
         pZDYslB/0Rp4sXrw+EoMEfSYQTgHIt9HnqZMOyIvJSKfFbeLMIlY+W2ojKAVbrD/zMnd
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563670; x=1764168470;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QeQ7og2zIf2WaBP3fNWtUSnP+euy7z4uHI8eX0I9W/o=;
        b=ozqb21I4dJEAzh/NGw+VkYCdpi2AS8iZsx/pQxlPvf4XZP3Li39QzBdAyOMggRq22l
         lvd1eFjhyJe4+a+ToeR3wLZn4dxZCON+tIkf/Elz6Fyapc+4cFigMfv5ewcAWsQ/uM22
         SLsIudkeqXJ5mIZkdmOUSoqxrHD0SJYVj9evNd+oVehchjmC1VaUIyq1SURQDYcQlsJ4
         H+oKTAYJjzLhb+EJUFjfaNaYufBOxddwkQXeo+sxiYEopeqOeJCdhiCcX+QF53ZQz6a8
         dJFE6J587KlsyAqTY7H7jjXleRPMKwm0/R22+DEvh9UNFEn11TJ6MDpbdErOtW6uFTkw
         CkJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9xHz+Rc3nOU74zUS1tFWc2iJMYPOFCunu4I6356s3gEUAqj2Ze2VonaXWs05Ja+JJXf+6QiS8d1XX1ZSkXC7I@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+M6CzzsfuK2iEmkS/+1uuYj7s1BA6ge6iky9IoWKJmB6UBkP
	3wdQOOlnKE+KhS+3XiEvD5eNt8Qu1HodVh0dL/dC6glyz+aGqC3Z6pBIht9qJCnPer4=
X-Gm-Gg: ASbGncseGD4gAMseZLSAYcL++0i9Oz50e5MCELA8w0yuMdNhpxlsPzWelhIY30wcZK0
	CkmSFfTqd1grtQk1LTBzCBc8qS3Ub1Vxx7tPX42bUZYt8vgi/y5FIXpwa4za63WEcyS4PueWNK1
	HZyLHXvxaIt/FenxzhXAFAHt2rr8kzEPh3NdRP8k/v3Ks1XXVMtAO1DCj4Xw+W4jKmHTrIGr0Aw
	dWo/U/l5x/CFVqWlsJV7aasyVUDl4fgfcV3NV632d3q0zzyrkPpIRnsykfgbWB2ZqI/RZ7cOKwr
	KDQeimJK4Fx00M7+t4TTEs7juALYx747dFaQtKlg6Gkbzf1Yw3zF+L5dPjGVl07sOM2VRexb/6f
	bIUit27jKR5KfoZX89gPwkJSOQUgDfoU/hAF+JO5V7UTn0VwozqtqocZ3JPo1hRP0FSVUkY0Wfy
	vaa7+Wh+jn0tNcM+I6QR3iRR0JG49VezY=
X-Google-Smtp-Source: AGHT+IE+tE828EFZZvZOt5BSe3ijLR8pMVOobVWe9YorjUhOAYJSEIXeL1tJpdukzaJzd5dVtgQ6Mw==
X-Received: by 2002:a05:600c:1d19:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-4778fe51e63mr185910855e9.7.1763563669904;
        Wed, 19 Nov 2025 06:47:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b102bc9csm53729505e9.8.2025.11.19.06.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:47:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs
 info defines
Message-Id: <176356366923.77927.3381277328480983792.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 15:47:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064752_510941_CF2324AE 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed, 19 Nov 2025 10:52:21 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S6, S7, S7D.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/drivers)

[1/5] dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      https://git.kernel.org/amlogic/c/1d80bed4e35710287c584f998e51980a34fb3a4e
[2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
      https://git.kernel.org/amlogic/c/ba8abbdfd09e64f51ead8b86afc6b586505919b4

These changes has been applied on the intermediate git tree [1].

The v6.19/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


