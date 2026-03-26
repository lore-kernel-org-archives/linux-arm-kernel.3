Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EF9106F30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=; b=Oycpl2GoitKU6fNhIShV2cGvFb
	kn8x0vH6NFymrubu09LXjBoEIV7/mlW4kc9M3pmfB+xtqHq0L4gyWv/5OFHBY/hEI/OCA/zlhLdYg
	E3VpLC0QyD5YXh89aZnXDWySwGP23mbDCyVQ14Ww8kdriIjJSsdDsnNrCckedVuFZCgX1Zt+DUAjw
	w8DEIGKS5K8Qvw/H9IkWcpCHjqJDPbcamZ2nFD7j9+Qg0pa3tXytDq+en3x7NzsdsgTDqfw2U6qR7
	r3BzcTlFsWQgffkffZBXUVT0Hp9sJU+xR+hkmSrpwcSx6bzjJrfhAPBz+48WSBJQCwik640X4+pve
	1iWt34Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcL-000000055tW-1mAZ;
	Thu, 26 Mar 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcK-000000055tB-05aw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=; b=hrcH6Z7XwcMbpVa/DLUBX6O7Zq
	Qw5/MvNOb4tdynSs9ZdOTarJu6bKqil4JQur7Qjgi1dGcgqurK1vD0C4AUMvkqgystGNdaf6AOhUd
	2cQMBkkb8z6Tu+PC4G53aBf6jAACIhFDtLm6BSi/QH3kfWUkVnMLVoxgmuyGSc9Hwss/wi/oigPk/
	aBXXBSG6U/NcAzKLIs6Hk2yZ3uykLqd3ESMn/MHjDoafVmS3AGcsOqlJ5RJXXWbOt1wrMJNyxATyR
	HhdAYxpBYLoDXraSTleDcpSIIbfcU4w/yoL6o/Gg/fQVAsD65pfoNgiSk7zsGgELvzkUCpjWxJ3P+
	krwiQNiQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcH-00000007pML-04r6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:03:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b4d734678so569348f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515779; x=1775120579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=oRWHvYSkTtEVE3yLc3LX/iZX1HqTMEAzOLtYrc8lmoC9glFojDBuTd1FZ+DjJIRNIU
         hsFDKpQ8UqOifAsDUcrGPOexFM9iTRX4R+9uh7958WgrRRzaAcsVYRN+inRSe6lHiKtk
         gbbMNV+Py3bKulQRFD8HT8El/5ALfGDzhjhcEeYmSGgcoGLlETFFLn8sIN76Ujhg/gKd
         gckJPAbrY/PO2P/cWy91NlBf49yW+L1icL5VbvaYwGRtVRvy/hmVUB4z+6qHYZuPRIzH
         eGFkFU59rLzPKQg4tKJb4PC/8I5xwA66DXlvnLTdvwAX9J0+e2KZgLW0A3P36DnLD1fc
         2d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515779; x=1775120579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=ievpfxd97+nfwY7EzpFnAFVEnvCV6WuP5CKJYw9dWiCJgbR4re9netNz3n7PMQeCiS
         x+B72YYzTjZ+FkwclST/NL6k6+i73FIDwG7KGjsvutWHodj3kpHYf0IrmztsPNm9FRn8
         Ab90Jjet9Qta61tZ78AK44P1P6gk5fRHYrqmncycJQxHNSCTmzW/FeSM8Bm1opAeo1Oz
         WvhCAGhjsCUiu2kjHQ5E4UeydGCdOFvuvw4m8uqHVg5JKsumKzJQq1KCbL2Ai0qXGOxH
         mxz4Yn8pqfFEP6XMfkvxX2RTILcrcNWFH1skN40USlE911Cjw9mVo+xiiFmtaYXw3odK
         qhKg==
X-Forwarded-Encrypted: i=1; AJvYcCWDh+d0iT5+rsvyYyv7cryHHM92yU7q61JzlnKD1Vm7JzOrmfM9kGObtTpQ+5a8tH81Mk3Sz/BrRHpUA7dFelts@lists.infradead.org
X-Gm-Message-State: AOJu0YyzFL+1gjkFC3kRdBP6dpixEw+lyP34hOdkiHYzc9y0+64cWxwb
	u6wUPltHbH4hjQlcRbtAP/t1X5Yzfm4xG6GDZ5cXFzhbla5jlqiIS+k3fYP+gT16GGQ=
X-Gm-Gg: ATEYQzwlvOr/trn9DqnQ/WQyBjXm8yH8f6ur6Egnb6jHwhlajD+aKOZQ9c/BNo2Ojy1
	Un09/vwTH+ZMxv+zp12U/I6CQtCxUc0Y6iS0p1TWTnsuEBIwNuBwvySP/e5fhv+NPMOTcx9QOP7
	CzL8iKqLUejYIwG8hPQ5G7V5Gu5Ynr/1DXxF9svArGgQVaJe2HYwttMPh0OuEm3usWSReAnjRle
	xdbgMMF0Beje5lPvK09v/n+lYq08pFH7XaIBE/ggzKcKwd5xOaCLA7X4BPsordvmNwXpnVJLhKY
	p3lLCSOB5gaDCIsHsW9+w3Ptk3LPN3iozFt2LN3PZgR6fQ5FMV7+4E90KNIAORlOifgm8LJ9Xmv
	EBinznylog5yBW/X4UQ+XKBkLL80pophW8Ogs7EiZ4WU+zTP0gG/uwJAIUgeAKwGeWZojvurP0p
	WL8Wpnh7p+WGe2PYiww/oX8vLillblNOOzU2gwtXXXQzfP8MvYGaBcLtE=
X-Received: by 2002:a05:600c:1d02:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-4871605076fmr107817825e9.17.1774515779244;
        Thu, 26 Mar 2026 02:02:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722ca344dsm14612305e9.12.2026.03.26.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260319023446.3422695-1-nick@khadas.com>
References: <20260319023446.3422695-1-nick@khadas.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: fix memory
 layout for 8GB RAM
Message-Id: <177451577850.104526.16114207536960435176.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090301_217635_575453A2 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu, 19 Mar 2026 10:34:46 +0800, Nick Xie wrote:
> The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
> mapped a single incorrect region. This caused the kernel to map MMIO
> and secure firmware (ATF/TrustZone) memory holes as standard RAM,
> leading to an Asynchronous SError Interrupt during early boot
> (paging_init) when the kernel attempted to clear those pages.
> 
> Fix this by splitting the 8GB memory layout into three separate
> regions to properly avoid the memory holes (e.g., 0xe0000000 -
> 0xffffffff):
> - 3.5GB @ 0x000000000
> - 3.5GB @ 0x100000000
> - 1.0GB @ 0x200000000
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
      https://git.kernel.org/amlogic/c/4b3917cd8492d72e576b837f78c0c398bda4ec27

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


