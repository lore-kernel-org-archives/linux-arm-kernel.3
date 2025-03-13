Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C0CC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+aTfeoVSIyB0YffFidlDzeB2TUKfGBiv94evK8t4xc=; b=RA93On62q2y3u4Haf1XDyoLHUq
	Y2WNKOn+Um0HhDYAnFBB7S5wcHO1YMbCT8dpKfky1zcXlsrNv2ANYe+ptuaGVrbf+4nP2thnUgD+f
	8mYoDFiIcbnR9Vr91CZ27qSClRrCqCkC8BRmHUFair0WSI4FbLMG17h6wPC/jOeL05hibVxaZy+oi
	wbpIiIQ/Go0qOm9g+OMB7VBJpc2b8izGk5LZHZNvcYfIjDirHI4EQM+2eXian6LM9YRzbSwMMDgqc
	y4e1NonhRJSH9NNBAdqJLYYidY+CSztzfHiGeeAXXe4in8RBODbyCOSelOwzRdgTn2ilHBzftpgPY
	m6aq6cYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgbG-0000000B1Gi-48yf;
	Thu, 13 Mar 2025 11:19:42 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgVW-0000000B0C7-1KRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:13:47 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86b68e51af4so351725241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864425; x=1742469225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+aTfeoVSIyB0YffFidlDzeB2TUKfGBiv94evK8t4xc=;
        b=BEuUZGtlsdMVlKCIo/FRW9Fo5NQPJr2sNTvYbGEOD2iab2dEw6B5uBGI1gX3XdK5Ds
         vmLPnWqFkpNO4Vu+4f9Yx9Ufe+6QP8A3O5n5CLVLfFq+gIxlJLeZ22wXM9fPxkkg2JXY
         Gbl06NT2itBRbTImwdL/wZjO2sU4WOSzY/je6/zGQGBAmtO9tNxoPqnHZ3BhA2h831iH
         DdL1CSFUftJ5nC7FPL1QkVu4p98eJDkBipcIPWoLr5869kfhtDhppS9P/WS5eNosxX5R
         +Kc5qSemYsZbGiy9wvBoHg76irONIywhFCnbwCk8FGKj+lx5m/7J8sKABh7235o2xwUn
         0l7A==
X-Forwarded-Encrypted: i=1; AJvYcCX8WvppiunOj6rmtoujoULFR+xuZAa6KEusqqEBwDyuD0jZ7QAMTqek7B1nIBNNWMnaTBcttcZANBSftomwR0ox@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7EXD5go0KMqwnX0wRqckhY5RND3Ofcv2NL3GaaJsRwtXN5LCC
	IZPwqdS8MV0KWIPdHjZHdi7Z2TJpMeyDq1PwVbA+Qfl3Uh0uSCEoc3jWtu9p
X-Gm-Gg: ASbGnctwQljAPtoTmSj1g44Two0GMQtZM8Qp3tRIQ+qm4OdXhAswY177XdlXKkZNJag
	IklZg+5Cg6DbjPgOqKB2D0JzHFs4M30jYWVDXoMfYmT/KOI1mjzCiog18XiLmsmTs4haVbGjLcX
	TuQ3pnBlKtPYaMYmyJRC9bB2IbjH1MLqy+UdDwWFywYL6ZWPwGzpRTkbruy7gW3k7UjvqFlT4k8
	l200be5GJchkEjrwPVjxY8saL2VA6ylbaYM3Gjh0+EtDbUSJyjZavHgQ/RSIHgRNawdKSyq27+Q
	uTt8soiWS9l1RoyRt41OWZemKzQHcV8DzOtvEVg7NPUb4pIv8Y6+dc9NUhKso/5IuDadmujLj+y
	Q710zQP0=
X-Google-Smtp-Source: AGHT+IFeHhZ4r8gUEPotdljGEuvcRlHhopLxU86sJiiXHb8GPXMoqh1F8bkzjNxM7aOUmvl4GMP3Tg==
X-Received: by 2002:a05:6102:508e:b0:4c1:9695:c7c with SMTP id ada2fe7eead31-4c34d37b464mr12116824137.24.1741864424862;
        Thu, 13 Mar 2025 04:13:44 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c3759dd36bsm124396137.18.2025.03.13.04.13.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 04:13:44 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d42f08219so376777241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJANRkHJisiTAuiSX6isNX+KxX1YtQHsTn7tok6Aj7UPlpuDS9wxuf1fraW1O2XpeS08uoMfXAUVkqThAzC5Jp@lists.infradead.org
X-Received: by 2002:a05:6102:6058:b0:4c3:64bc:7d16 with SMTP id
 ada2fe7eead31-4c364bc826emr6410107137.16.1741864424462; Thu, 13 Mar 2025
 04:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 12:13:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_YE2pf+SxXR5sWG1+aG8wv5MtRWk+0+ZF_n8ao7seRg@mail.gmail.com>
X-Gm-Features: AQ5f1JqRTMYro5mN9behN-6IiqjAuHgeViZHARDgbLMt0YG5Pc6vqgxhUbgQtPQ
Message-ID: <CAMuHMdV_YE2pf+SxXR5sWG1+aG8wv5MtRWk+0+ZF_n8ao7seRg@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add NSS clock controller support for IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, geert+renesas@glider.be, 
	lumag@kernel.org, heiko@sntech.de, biju.das.jz@bp.renesas.com, 
	quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, 
	javier.carrasco@wolfvision.net, ebiggers@google.com, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_041346_354098_9FE8A91C 
X-CRM114-Status: GOOD (  20.41  )
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

Hi Manikanta,

On Thu, 13 Mar 2025 at 12:04, Manikanta Mylavarapu
<quic_mmanikan@quicinc.com> wrote:
> Add bindings, driver and devicetree node for networking sub system clock
> controller on IPQ9574. Also add support for gpll0_out_aux clock
> which serves as the parent for some nss clocks.
>
> Changes in V12:

Thanks for your series!

>  .../bindings/clock/qcom,ipq9574-nsscc.yaml    |   98 +
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   29 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-ipq9574.c                |   15 +
>  drivers/clk/qcom/nsscc-ipq9574.c              | 3110 +++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h  |    1 +
>  .../dt-bindings/clock/qcom,ipq9574-nsscc.h    |  152 +
>  .../dt-bindings/reset/qcom,ipq9574-nsscc.h    |  134 +

I don't think you need to CC people who just modified the arm64
defconfig before, but never touched qcom clock drivers.  The list of
maintainers and reviewers reported by scripts/get_maintainer.pl is
already quite large.

So please drop me from future submissions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

