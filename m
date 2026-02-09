Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B148E94614
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=; b=y1a+z04HOGa5FMMKu2KjN1cVtM
	UYKQ7Fp2YDwlBMKnz/aWluLHXw8eOrwLKB9Eny7MHyIY3n4esTsF1/w8CP9OlxCEU0ZXmpnSJ5axu
	Rcn1ejH76YUz1LI5aow6OC4zNeMJqOt3l/tfLWSSfcDKVNmJpVgdotqFgctTLnXkdSyXvCa6oTjkT
	JBshlDxSvFarzBZe3HQfKept4qEKCFPCgHX0vi07Rm3g+XLBm+MiwbTYbEp2QKPGR/46n6bgUvojP
	jSt4FJEiotFdQVXf8CmQVMfL4TtDp2jSGjz/wbFphFolj+paGcR4zelIE3OxJD7n1rWu/31vOnuzU
	MV424ACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYY-0000000G5ed-1uIP;
	Mon, 09 Feb 2026 22:16:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYV-0000000G5ds-3r49
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:16:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a7b47a5460so28647845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675391; cv=none;
        d=google.com; s=arc-20240605;
        b=cMmTYqa/9qYvL6uxaGydKA3p6A1FYAZzppTNq90CT1/BvuKlmDq31UzPE11grTFa3B
         RWhVaM+jm/f5Vdt7kUrNmZX3YmL2yxxzxis0YKuT7S3HmZu90ZaXnZc6n2HMEV5PnINx
         l0TcIjliL0K21G70CGimfJhwPQ6alz9HUqBEyLoOqW46+dhuPOk78LGbTyfuSl5ES0vo
         BBV78W/vUiEjpJNJLEpcgC556YD50+pVvXyTWzoFcZsrwA/v1RvB0QySnO1LvDFlFCJ7
         NZVdMAsU32n4YkPwcYJdgAGaswpcgN8yedXt93dkZSrikHkgby7FI/zkQq1pAa7UUDGg
         Y0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        fh=2GE12MIyNQej8jMYibwGilTGKL1qF3s6of1xySxomZo=;
        b=NbbHGQtAqY5Rl5OMYiDixWIeFV/1AToa+qIk3/g4wOP+FXqR5dWcnxwv12yd0KXdXs
         +9twWgx3m/yb/LQu0qHgG0mg2xhYt1HfZIqV1oMntipAH4SFg2Gzkrtn4NZ+izoJUjxY
         3tO6W7SD9TqnsIh/BMuNZUecDMaHryPW7JoBtVW/CbD2o7VkRsT7chZ8IruyAl0cPfd5
         pK9ltl3J8pyZAJCdrZoXaWuf/YISjXFnth1QrZBvr8uuXsGvYflTg54Ge0O6ktZcr71N
         mqK7YD4JwPny3L8AcBBZWh1D4OhSlFCrw/DoegULigUvEdajAf5JnCVizAb12qYyMp+j
         Juxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675391; x=1771280191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        b=R50yMI9bqHGillJ5vWNykSM/r1ehneIoMXrB7HkbTsp16yr2bQhGl9crWdFjp31zSk
         PpSVKtzvZxSVc2a4yYO5NgLiosdTAxrOF/eMF255zCktnan1jonr2w2Gi5OxMwquVOzE
         7hxcEr2TkoWnD+RxK0tpr1J1oIvQAIWkgBBglesZnUF+9nyPEF13m0if3Qncqa1iRjA3
         5o3njAiV5zvDOiswjWHyINYzV12bKnu1Ghqe2EYmMrluXEC9VtwwFTeVpHEGD6MO6bpJ
         erV2Smt20Cc9BXTIkjdSu4MBu4gTlMQHOburPkYo2BjGma7LHpkPD+oOd2YH6XEw2ulc
         sFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675391; x=1771280191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        b=NUitcdmvAWGIZ0iNPdFD1oAG8NfLQmZzWjFGaDFu17FdFa9OGrS5LR3BfF72lX+80i
         GTJyGd19up5NhJmbW2epQ27HemjsnqwlvbZnTOxjDz39WOo1fQGo0SPADedI9mgl/Ple
         f3JXiu10KlmTO95WcjM2vA4/I4a2t4jwgTChYwq+KokJN6OGpYM/GIcI/beOLaE2XYtw
         bByPdZfDE/YLzZvfb2nYYEK5kj155RsspKjT4JEFlkKBAxhst1SgZQDTCWRmeDtU3Q73
         gQpiw2+7L6IKKej/UZKxBbLPqajv/cZMsdKk7A2Dlqs+ug6AqjC+/UpZynGImq0CEHT+
         AyBA==
X-Forwarded-Encrypted: i=1; AJvYcCXwh4848ijXSLhidHAVgqim9jN1ofcnD+pW7+5b6icekoLFIjz/NaC7DzaZQkO4GrW516HZvyczN3eVm/LbpMSn@lists.infradead.org
X-Gm-Message-State: AOJu0YySlojWWyJKnZOu5ywfIcCpgI7sy2UVy7MpZg4zE/wYGXJDvENj
	X+6cW+ZYqzAD3J8lnuIfxAP3tvNcT6EAzoFwQ+UbCaHZYeiUmYnVhgQ0FS9w8axS+Ui0EIWVKdb
	SrPYC9oLZeH6R6m+wtHL3OuyQoIjG9CA=
X-Gm-Gg: AZuq6aJQ0CFkmUYWlhCFGt/X7obD3qUvRFdf+YetuKxjoLGI4EqZiE3PKddMZApG3HL
	QlO83nrHlH8shy1oIBtNle1ZmP+gDovALTVLqHNyZO50s1F89u6Xu7GDfPQhc2o96+/Pq1v6E8b
	ox5XlMqfmKVkWCo+NbkfcdEpsCO+ZfVpRTr2jzZRI/+Q0N98S/b7xOi+lVjcf6vjfkROQ7o4xwQ
	Yb767Hv/XbzwGAnGlFWixAf6bM86tHeXaJWGABgmToucXqAjfY9+xoMwX5MpNv9rj2E5KYs3VUi
	b0v+6fqU1VCirOfnq9bOK7hJulfu
X-Received: by 2002:a17:903:983:b0:2aa:d288:851e with SMTP id
 d9443c01a7336-2ab0fe2a8a0mr2557625ad.19.1770675390613; Mon, 09 Feb 2026
 14:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:16:19 +0100
X-Gm-Features: AZwV_Qh43dpkg6GHmPnCSKEhcU2fCrAkcN4Vfkjmxi9aGDpCASTd9MHa_ZnwnNs
Message-ID: <CAFBinCB6kgbzm7bWv-=LA_Y+zpB7DwjJ0dqiqxumwuUW97Ddvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141631_988487_FE1E6EA9 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Feb 5, 2026 at 7:04=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
> There is no need for an extra compatible line in the driver,
> but add A9 compatible line for documentation.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

