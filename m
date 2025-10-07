Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F34CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=; b=3jOBs8V+Z9NqOscmWPh+/VRhmz
	KnAktvDs9k2FiRcAuv4RJOD6bARc5owNs6lyfjhFwqk/Ea1I56Ml1ytjC0hgnuWwUobH5QHxwRdQl
	+avFqDFjkbGrrUhTKhoj0SMVyYt0QmINKQy2nc4zXhthxYDm6UMLbIyZCGX5KdaH3GxnM7Lugf0gl
	4QDMXjEXgzutzprX8zgyQhjy9u9Dz0637Np0Ed5jYryEw3hM2+aMSrKJKAKONxRcemA1em0N7AO8U
	oL5H7THNrwuYAQ659mBsPHJEAD/qPFpYdoZWEbtwnOTQgQ+Tc0n05Cdl3h/z5p/XGtpP6XccNye2Z
	5kdWWxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6E98-00000002jme-0Pkl;
	Tue, 07 Oct 2025 20:18:54 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6E94-00000002jlh-0P7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:18:52 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-64c771980e5so2976092eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868329; x=1760473129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=;
        b=Myv1u+O38KC2rNMhLzPXx2uTZRf6vN8EB4HnuXCipzahfaafue8PiV25PmUc3/8w66
         epZ6HEIX4GcMuZJHt8yh+qPx9wuA+W06oKW2tRukP7MIFE7N2hPwbIq2KY/0N6uQDOtX
         F4pPu8R8clOU7VClRtWmedmH4uAppBW09Lus4ze79FjsBb7dCg5pEeyAN8blTgQ3GaCs
         tRI9+ap5OJovZYfpb53OfsXfaPrO2JjuS4H/mGVCEEbYvGhCc4f/7LsrJjqgRAEWyHV6
         /i9HnNj6tayDe+iclzPg4IKuC5A+uZRn1juemK66o6pf/uhPk0Z+LEVmR+a+yYMGPKNU
         GT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868329; x=1760473129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=;
        b=vY0tFzgg+nIYxZwT0tLRIZgIH2Ft4bO9ChHqFv7Fn+jqa9T5iT3J+cekZS5kmgnmfJ
         0vosdm9Mf4foKQhI3Rfkvm4Z2wYlMUGkA6kcj7W797mAraCDWcBPjNoY0C5GVw0C+TkT
         QkDHuTVe6/uE62IYhdH5hrrw3dGEg20CMdeMwSoTxayYg0Cp9l/ofTGCrE9GiGVa4l1U
         8dcrZ5zIqjCFLSPKqKELzMOcRvdX5lnP0SLYWP/C5icmxxin/ldfWsGsmsXFjb6F4W1i
         hzh9uOmxvftpbc5VzrBSWXCNlb18wMBr30eq+llgp0Ips3ZDurB9tdRkaJMSf3mfC4Qe
         SPXg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ImY/Co0rkJLRh2ykFxt4iKk2XjdEY46EqLqCdJMnLk6+kio6RJ/gqO0iN2faH55iaSKGhhRHGEPt97jyzbYQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk9JUQkRr7X83852UYKTVaRNVqJGx8xM8ETTJR0WuqTNjOoi4F
	KubSI5PJTfpnCQxzvDNxKAa5hIaalPftrScZVgQ05Pwchlweu/mFrKTeO44TAh/sm1RWdkT48x3
	M4OpYo+qrncnKGUPlh1LNZAEqNm6b4t2XQ09rYnT+Bw==
X-Gm-Gg: ASbGncuOnfUzglf8mke/Y067tsJ67M50WamMjaeEVhU7gH8yHGDiEva7JxxeFq1cFLD
	BLFDoeX6LaxZpP31O2Mbqcs7eUG2gkhxf4U6+QJZ6YJfNxHQxOdyEx4pCUwbqBuhSUsaArJ2ET5
	iEN3Co85sUDILMWO2Regx+B8YygNDQDeBOAmMqUQakZnb/+4TjJlfdYbQf1NKEkwWqbEACLPocg
	6JPdRJQzQA6B9JwlJsdRWWpbxy9ZL5g1fwxRQ==
X-Google-Smtp-Source: AGHT+IEL4dmypG8WFgpOU1UIUsrODE8etCKEY8zyKzUkyzhaZJQ8flhaIQqg8X0wJtfFE1WkEjdwwHsi6B9jL21hYVk=
X-Received: by 2002:a05:6820:a10e:b0:63d:bc20:a63f with SMTP id
 006d021491bc7-64fffe6daadmr379683eaf.3.1759868329050; Tue, 07 Oct 2025
 13:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:18:36 +0100
X-Gm-Features: AS18NWAMBYtEWn2vhviwKZeJuPljrJcOS2KOQNcYCHTnuQAmZAXGTQe_GLqqgoE
Message-ID: <CADrjBPoZpTUN5N_Gh6E0LFmndJs4_nnSpQ0t=XORQHwFn2=BNA@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_131850_293931_0F8B9BD5 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon, 6 Oct 2025 at 09:07, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>
> Update the code accordingly.
>
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

