Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6922C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=; b=arKlRdPzEf1yH3krKKpu6iedWd
	HTpM2lf4718ZnnwEo0Lo+taoefnFKkyFelr7K8j53sGtqx48bGUJDpU4vVViAnrx42Q5qffQ2AJ8w
	MhV6MgwWlub5S4H4iviVT2+B9CZZYzgIKy4HaDJ1jA1A+RsoEXAi9bAbHfqZqD5oJXZnigcZLqv4q
	V36rM6XwR8G+7HadIABFzuT5TbxstlWTSM1aXTVzDlylXVP14tSpYs3YmD+0dMNTWSlsJJiNVwm9U
	6gboijVH6+JNMWhrYS8c3ZFBvE5Xhcm1fY5DDmnMQfi5tPhEFkiNdVE/Q4T8ZRv0UyBshR9uAdVSh
	nQF6EXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIkC-0000000CGY1-3XoS;
	Thu, 06 Mar 2025 21:27:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIhv-0000000CGGo-3kfx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:24:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so1688597a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741296282; x=1741901082; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=krG9xExa0u9IaAooEvDUJCkcGOWhJAQvgpAeSw2v3a61yLfKGALXjCmgfBtUuOeVwt
         MFObozyguHAxdSmkCaOIDHdMM3p/gufLSOk5zHqHzHK0A3GwBM4d8QLzliJKIiLgBtkY
         9UZWP8wrJ11ilbK3tv3xXbDLIS+JlpTSFCyOUGTYAy/czU0KH24ycZIY7WlqwDZS7uBc
         6Ow9zrvYTS3u+BGge1L2jqD7UrcnY0UoCAiwJ7TqKv4PGXIoD5DlvLlJ4lBqFzSY/bQt
         VN86/yYII4Yait3QsVhUPE102klhYYhd08vvTP45rgUrl+M4H32jiKHiZ++LqfUj4j4x
         6Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741296282; x=1741901082;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTLuvp354LUCFBEjUn6vv/C+4kNgg7zXepR1kdOwbgE=;
        b=SE+XsbXOc1BAwtiFvpkdzCRboA090UNrCp/ERTr+rFshX/itb7grm5YIQu/pF1sy6F
         AadEX0mSpEEHyqqXfJYNLRwTy38R7eWQ7ckyIcNfST03DSE6KLNtkhTy1N17bn9JyqyW
         5WlPDCXmo8RXlYX+m8AZ5Z+4KbYD5f8uDBFvh0GuQmNPWHwIGofHYb+93F4HWJ5GMcQK
         MWPSKkihyd77bgcYl1HDoktvoVNLD8xyYFVy8b2lmQGAk/zc1nKNlpH672952D0+ttJ0
         ef2bnOLqcxETfDzm/JqL/+EUEynRwhCQGEPWFoFK0OV5L1QOrsIUVMuxZ3L/0LcFSS3t
         nBCA==
X-Gm-Message-State: AOJu0YwKn6MIDj3N54fEH+NqFgxReWW1mpb69080ExnBdYVXxJIJmT6H
	Ok6rKYCvgyg2UKDXnC0WJTR9L8hu390mmnkmFjrwq6lVx8j/TyeX5WvKPcNqBDo=
X-Gm-Gg: ASbGncu5GEH7Sbb0I1iYKJvt35NR2xOEgxK8c0r4AaUTRDClxdT97fVwVYR08CTxPdy
	81uKy3pr6VX8Nd3lifnigDfVR9LQSiSl3TuVqS0Aar2+UwDhANpKQpsQMGRw6bfEZrJ9fC/shu1
	ssqwDwPMIaRSykkKw5DSLMlm84Ue0UsFPU+WDRmHjddyxyOgqSCWIKLCRz/T6xDMWFPD2fUJ0aB
	6mJw94Q0wxI231OiQFrRa3CnCT5iGBln4r2Ck0xjCs/R46ku0tmRbkJWLWhiK4iWaMCAadNIQ9V
	bIokNTb38DDyqhPLWr9QBcTUTjoF65Q9deZYKsRFzZHtPdE=
X-Google-Smtp-Source: AGHT+IFGoQqzB1ks/w233aQfmtwjDd/f0Of8nZuLXXAF+RrDFLWTghW9hL6fr6sdxMq2SuzJeJQr4A==
X-Received: by 2002:a05:6402:42d4:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5e22e66e3mr857005a12.16.1741296282233;
        Thu, 06 Mar 2025 13:24:42 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9315sm1493110a12.46.2025.03.06.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 13:24:41 -0800 (PST)
Message-ID: <67ad046453d722ffd80370d45f4f515a432ec327.camel@linaro.org>
Subject: Re: [PATCH v3 4/4] pinctrl: samsung: Add filter selection support
 for alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 21:24:40 +0000
In-Reply-To: <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
References: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
	 <20250306-pinctrl-fltcon-suspend-v3-4-f9ab4ff6a24e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_132443_940850_D3EB8CEF 
X-CRM114-Status: GOOD (  11.66  )
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

On Thu, 2025-03-06 at 20:42 +0000, Peter Griffin wrote:
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


