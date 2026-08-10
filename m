Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E9C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=; b=duHWkreCsgeK+LAYw87iJ9FT2m
	GCKIe3W1tFr6qGXRrq7TVFQ7fJiGmEaNJXKvhV9dU2dNcZ1EfQ4+kC41t5gkB/xb5Sl9+PuXmUBtB
	ru0l/kzAmThaqQCwZFsOjEo9Ukqsil90lGaZxeAypGBf+BQ99Kgt0J19sUy/Cwq2YuHN4q/UOX7B1
	oNMiPTssmWCB699kvQG/mjzxfL1tezQWi17VW0BP9rk3lw4XkYAdrudnoZs2cfty/PxRUcGrclzf0
	OWuAwrZcbaNEU21q3Xx6/yWLUA3U3zTZtpdFCyZ8uJmoRk5/kDzIuTfCr+wsb0DqyEqLp6CYFsnlF
	DUFZT5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJtM-0000000B9ln-2EA0;
	Mon, 10 Aug 2026 06:53:48 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJtJ-0000000B9lL-35vS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:53:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso11455111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344824; cv=none;
        d=google.com; s=arc-20260327;
        b=K23y2jrYYpdM5J4hjc8sJ5kdm6OkZ1dWlg5p4khhTYdIbTClpEjZqjErIEAkgIeF2e
         M45vwPSyg4ura4AsnRMki05Ws6mdy0CK5cmu58NBg8KcRbh62Cwfb6c+iAf46ZRQe2GN
         TeDcWzbQTDsjmaV5DdzUuZLeunX4fibc+Gmm5uoeWc3VRUYVPqeWPhkIoMw/DC8jlV5m
         oPz1dnzulWb3zP6Mou6NoQ066dURziqevJniBftwyiHJKJC7ryYI4qIgOmZpFPAAC+RO
         LYGArILDyhYime+v9gXtnE386KwWuGCyNzRWzoL3HFBJSO3ldwK0sX0R+C5IIzOOzWS+
         isgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        fh=QzspIiZE0L/vtsF/VLDQFVmipSTqvTfLnY4lO2OrTFk=;
        b=FrPsfwx1+JvA/CcXAbMq3v4FG2A4npxoZKi1NeIWSlwsdWqhbrasCkwWQA++lIjT3V
         g0s9lQlgUIgUbYTLk9aqdCcnbI1QLrYSCgF1MDgObZ0C5y5neNb4f61XgfqDgAC1ibc9
         4iHvz66JB6J8c5/vWjUT9isrccTgGuk1AO9UGujwAsWP45kGKLwTLxv/FlaFeUAXI/ri
         4+0dzhAx4P1koBiweH6GJZ3q0PPwZNEjgTqlRY5jnZ5lspNiXUwtIiWJW2blZduVpfEk
         8E7oZa1L5tT/h6/fGHYbh3l0Nuk7K5k3zqna9L7sQn1C2/kKYGHSw3qtjd+q2WDl6aSB
         j04w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344824; x=1786949624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        b=Su0pS822/pfEVdOcBSZuOPUTNb9yfTxvbaHSMq7xb19i64RoH+PABwGD3FEEuGSj/R
         ZMT7NmYA5ksiJbxQomSOOrR267oHjqB2T211aMGKFiEmLUSn9yN5To4AQkI1dPo4iyn+
         5W9hymWMTYCZjj5kN1CooECXVf6qz9hKGJZx9YqwRmQXpl7YU5BJFm9CYtkCLZM30kyr
         IYA1wQXl0TdxxHKVPDVDDVeGW8d2Rr3Bw7qHlEZ+DnrO4zRq7nZB9gj5QadmPae25zlF
         fgCv+HKFHmnQDbQSezBz5G3DSyxQzwJVWa4YNhHh0hywvQU3sX3tHYlNN2p7N2Uflf7D
         rtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344824; x=1786949624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dGfE44jtMibc3TzwobgpBtZr+Oo9NBetUcMQzWQ7Yg=;
        b=SyzSbdW6xe5HXbziHYoxuHU35yOXjq/Y/xFz3jQTWM1BMmh62GdgOySIhSDpI0kkIA
         Irrf0yuH+pgEXhluxNaXwO3CaVROoD09r9MuLVD/NxbTOr2QMJw4aJUWNV3hNqGFCM61
         M4/s4RF4VINQ54gZ38cGiWa8ubTcMbjrA2p53TMqo5mIMZHfJCNwBlZdKONkD/E1PIfX
         4PvcEMh8Wjp7vzr/R33LfF3klYrgl74LUwYiXzFwvWvuR76Dw7Mi0jgoS3dluhfWlnNo
         bcfKcZ2DyfU5Fhpug8TaWPvnCBtemujymriWQRbwZc0pf50jCoFF7C/KZCCCR96yvvVO
         ESGw==
X-Forwarded-Encrypted: i=1; AHgh+RqXp6qz06g9ccXejbRcgFhIz2COcZXONBCxbw/TwfXzBsJd5WTq4f4dj8QnL/5kZ2kKG6dH/RCUOcU3ywNXdh9L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0b/Y0Y+F8LPNhjJn4g7h/egghDKkBNoe8odHPfcWMC7NFtNK0
	mXdmHr/ulzItBoUz1BBZfe3ZKClWrswocSKDrmk56qS2BQ/D5+PjtTjppsemJ764slH1QzYypge
	FGlHAMl//1FM0iWPUSS/bDpiiOU15gKQ=
X-Gm-Gg: AR+sD13r+kksvvIymnuRvSIyrrvQNRvePWsIpvE70wwI8fZJ/FusDQMF781LHe3QZUl
	x88/ymL4lZxx8G0hdxmEkIRp3oBJ6ctUUskBO0v2cSCatxlbK6+dWV4kiww26UjWOtX8IJ3/DSh
	zKiD6ZyRFafqFfeWCfbRaTr0AR0C9CwHSLQXFY689Ka9mfyJ7LXDx7JpmocSWxUXITWsVkmd4AQ
	3yujxQJ+Movd9mIEkT6gBXuttr9yhxxejjFgqBx4G5+KSegF9WoLoTu1kiomCCSJGZUguyPV8Nz
	1UkLdaWQTAUisnUa3dQjQov8nOnr+IA3Ny67Ifml3tB7osw0LRGIU57fRYopR9/UMa9YaOsEhnl
	JMcG+DbYlLAYQP1qnMBlKs3uw2NTnag6qgs/F8M/+GXRbtLFkz5lvbrCWexK8m2YodqzYhrMp4w
	zjEKQNXsu1h+xzz30iXoH2w5PHU0nieHnpvegZ1p7WQQ==
X-Received: by 2002:a05:651c:b2a:b0:39c:828a:ec28 with SMTP id
 38308e7fff4ca-39fbb2df6bdmr43123211fa.31.1786344823384; Sun, 09 Aug 2026
 23:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-2-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-2-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:53:06 +0300
X-Gm-Features: AUfX_mwCXKQ_EAfNQxh1R-sI95Ad-aIasUsrS1FV1TnKKBQz8muupu6Ky_cvV-8
Message-ID: <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_235345_792645_C9F27B39 
X-CRM114-Status: GOOD (  10.26  )
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

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

While this looks okay, have you considered actually having the
platform_get_irq_optional() to be optional in this sense?

--=20
With Best Regards,
Andy Shevchenko

