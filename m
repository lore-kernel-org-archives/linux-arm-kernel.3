Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32685C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=; b=KL85qfOsuQ76jAOu9ePN2sYql4
	IHM4YmLUI6+PhLXuYLwmzyGhhvhGVG76gF+ARu9/yq1nE34Va9CZuXhyNgeG5t788i+zvpV9abzTR
	jx0BUYk8UI7MTvWzT1Q0wU6FeBz3+BXkO+KBo52zmRq4v41RzVXMc0ncPLZqBhFindJiFSIADW3IJ
	pKxYW0Rnl3EIdqXabpEJxzlBtJ3bp/ZlwpTRp8q2Usi/k3lltdML7Nlwj6aThDtwyJS+S+uWfL4oM
	nusWpYhaA9mnW5JkBEwAVU/jHBatnPWJPb4khWRm2f71/8S00qKOl5m5NBkfbp2OVXZauiuqyeRYB
	XZwATRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4p8h-0000000FceY-2Ef0;
	Fri, 11 Sep 2026 00:29:11 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4p8e-0000000FceC-2A6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:29:09 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8200b55dc47so3486587b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 17:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086546; cv=none;
        d=google.com; s=arc-20260327;
        b=JG26tsJP7YWZNUxdfLF3fuokvC1yEwzOTvVuwcAqArcr91j32sAabe9Ql0Aidor29I
         ZLhC8t/OsNgHLiI4Ci/lp9QOHH59KPbQQbJZ0VAmJgiu2EWUAl46buMYrpEVtgeTRLbE
         ynyjBYqf8HXbUQUaLpU9fEIv8fgjK/8mosglJ9v1YuApa1sXLdEjz94/Qa45QTHVSkq9
         3k3nN4R4QjKxBNB4qh3EoIcTqDG+jlPwsfFEPg2JyJsYKQB10zsTNh8hnQi4AU8GYQxp
         fSB5HCm11HEFsI2E2Uuc63n+MxT45M8zFgJV7+t0g8aTtq4jUKG1YGkClPQbt1CdrIQ4
         JbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        fh=3EhOVPFQ8dWQk7a4FmIoXdNQNDU5k4XZ+wZRMhVlhEg=;
        b=n4JMp6NaeOsWGGwIb7F41vwUo7CXtHhTVALuDx6bhxSWI3XnScfdzp+gfRwRwkonmZ
         0FkuFLA5FWCpcN8eB7QY1Xk52MDaIOIe6QlrnzI1P9CGUtL5DtiXF8cibzZinqGJFhpl
         N0zVlCbi5snYcNKp+UdWH7Gvaxde1UMBsfPqYlRuwuGRk3GM174XnT7H7RVnVuGWyxg3
         iypUqpXBw4STrATfXa3Oi691IlcAKMOtXhRlq9J2J9p4UZIUPbDicueJgpFT+Q3qBQTa
         ViPhHx2KA2A8+5sG6S6nbQjJNS86LJ/apWW9o8l4SjJD9rDbIVZZnnsnqXTQf4N/Lvbe
         5Yvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789086546; x=1789691346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=S6VQo2LAo72UiBg2ZH85kG7Mh9bPcdB+0ELTGuM9BdU7aGQLwacltu0djW/Z3bz4Dy
         qCAKiUnEz3RS5R7rRiBuzRsxhda/HE7S8nCj8mHK65iE14IizbjlVs1aAOddy1nTuWho
         yAiyQVI/Vx3akx90By/IQXPQrLfASthTmniBYGirDTh324UxIEFa+KzOujnie9ukqvMf
         4+IWR+z+T8wd1S5O55xn1PTojVcLcGnSgLt9ClS7E+gckkl8sVvm6yvltgsiAcBueqpg
         IfltQ9y5DB08A4VIM1UOcQ+xHkEOlxYCEfTBkGH3og88mgntr+Ilf8gFKJuZhOO7QCrs
         LLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086546; x=1789691346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=rFHxS6uYJoEZfxJwnXwQSifdUh5KywtTxNNkTCkc4WGMzidGOZ/n4q26YPevgYqctI
         /ptCjqzQokGuVMiTJkXNXLb9Zc3Sd5KpgdMKcAi2MqvEWge4zeRQr1O0hwtR9bDC4QHG
         S8oGPhcDS/1ldOY9gWtXl1qRvRqYElWBlh4qT3B5EROioWdZVqsnIfAdztuPjtqQbBVB
         VhnFJbeaUne8sDr4lIqz7sACf/4823jgZ1B7RCg6IXgUSQNEc/7Dh8GzOvvi3+guF94a
         CEoEn+iJNSdEnaIWnyK1n6b/i4hwwpsFqgDYwzZ7Deqp7fBffe1yZL0jq1n7WhiqR+Fs
         fteg==
X-Forwarded-Encrypted: i=1; AKwUvBwUbBanVMJyEOMz4WI1eDhObvl+Xx3QyrJtGCRr7OlT8XHvOltHjAEG0lUgsbkXHaWYtOjvapdMjzlU4h0P6yjy@lists.infradead.org
X-Gm-Message-State: AFuF++k6UoNlF6Q4f5dkeGZkuYlqOF8KvXzu6fgP/PJZ1PsDtYCDp9qq
	zCvv+fnk88lkok/no5D2KHCOyPRyVAbWJ7RLRM4BbctKsc4iiw7orla6HJloj8Vz1+TI9d/W5vN
	Bqu7SMSPX0Sfq2FQtRNC+sTnOOCLgCdyqM3FAodGHzA==
X-Gm-Gg: AYBFou0XldET/tEUqnP2OBDExdWkf+DzU3wgix/z1j4Si8RYYGUpjxWHGdMaDe869lL
	g48Kv7Be2XOf1cXMmx2AqFpRgUUiiafKfX0PIlTpEo8DINrQvcMWr01Q190iLxQkpHx3GkEgLtj
	U3i9HKOUpUQPskAL1IaJdkfKAed+va/ep6qeBnObEEkoNFZvgOTbz19ypsXMz/N/Rk4YuSB5AXn
	wGxJglR2pqCT4mjkXKshab4XV4te71nwX2aQSQVWvcj0b5ceMjhzRSOqOz8qP31sw9ypprAth79
	m5GA9xOh2Ff2bb6qF39FA6raoHcCbyhM+zOI/R4+HcwUq55OEA+DkjWl/ZluE9SHS5tM3qi7KuK
	/7P0VsP/V5gcnwA==
X-Received: by 2002:a05:690c:5805:b0:869:adba:625b with SMTP id
 00721157ae682-884af36088bmr6196187b3.25.1789086541234; Thu, 10 Sep 2026
 17:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:28:47 -0500
X-Gm-Features: AcwNN1X6TqUaxW2SYT093nOASK8ddNR0F67KzkQysIy08gGg7L37ANaw7yFR2e8
Message-ID: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_172908_586260_A43AFD2B 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08..0b614caa411c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -163,6 +163,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x40000>;

Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
kernel (v4.14) also say the APM SRAM size is 0x30000.

> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>

