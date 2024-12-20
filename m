Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F2BE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 06:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX+s8SYjoLyT8V5e9PoQro4jGwH4zJksKdm1dnt49Ms=; b=YRSCA1nFLqOj5u2V6MoHRN1i+z
	nr2zzkjmSo+ep3XOyQvj+gmUC9/Y2fuqpuYEfpo9+UrfK4D0qrKlRPb17zjS8ZHHqaldChkuXfoID
	cXIny7yvGeQEdnWzp+CWUJTLuaD3v8Cyqsl0W1kY+Q/rotT61Kb16lwD7ZKY1TuwzbHE/Jf7LQkNZ
	YTjhHx8eBsJMHwmjpNIl8wHf4znvn+Jz/K3ykrwscd1lYuPjKc5n/vaurlw9XpCfEZE1qn3P4xnxP
	R0IiXzvJpz6LuM6DcwybBrchJtcrGeOmpaCFJqaT7cA4FaSsqmHwR7npFXbgz1fjY65AZkR+gaPNr
	Nhn4OzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWgS-000000046n9-0w8S;
	Fri, 20 Dec 2024 06:40:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWfJ-000000046hO-1iqL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 06:39:14 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso1036865a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 22:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734676752; x=1735281552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DX+s8SYjoLyT8V5e9PoQro4jGwH4zJksKdm1dnt49Ms=;
        b=Xt1llWn08f/ML1LWKA9iBsh7pXqaGC4dGN4FBBaAHaSz8YLS1sUV9sP6U1GzE0MIGH
         RZDWAvyqk+f/+0bTaoJdwtwsWGE16SHgDqMsZ61hwtnwsWvXxRZUPjg5Pag2AhtXjzgV
         T80hytpj04cCMs8sAAE4aisK1OOujOwilJCEP7x7QSxtdSjTn5mUWrWhM9A4xuKPvPDv
         UqowDr0ou0royhb5qJa//bclwhxPz0ZNqRCP3iCArsqvCZY4Q448OSMQCXUIo+VHL+rw
         HYvQp5qMhhK1r8DLQOezjKhwSks5YZUESHuh92JoICLwzLMm2q87R2ME77dVxVwUc2cq
         kgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734676752; x=1735281552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX+s8SYjoLyT8V5e9PoQro4jGwH4zJksKdm1dnt49Ms=;
        b=veF8dgWITDIQAjAEOp3R01b+1sXAQ1z77ifp7d6PXvSEl7ZX6YW9Af3a6jjy/6Lm90
         Zzu93yBZxCH7N4WgmT9K0Hx5G1tf+QU3reQoh5z6PdNx1jlwc78F0vt3AQ4cfJrCYrji
         SnTMSZDN9Vf23sG3PV5+7l3T2hrFQd6vyoudBZVe1yH7SbpbBtTvirxIckWIVcqUikMj
         hwFDhqGZgOHa0jSXvkILidlK/MJVVG6LbHQqAYjqJHWhKMsjjJkfeIgcECuyigZHzqQi
         DoIer9TuGzdb2WAMFVgMtew9Mvwz59dHz1J5O6r6yymatJMyQS4c5fD/OTWXlxH0ZpJn
         bdFg==
X-Forwarded-Encrypted: i=1; AJvYcCX9JxrEko8fB5coIUo3YzzeDB1UcQ39hqCvC/6BFd5/rjhBmyi8+DAO2wkQR36caEVqfD//izw+0FIAKAqDTxE4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5D/so2g1Bg7Bc2sjRuwC0DQs5JQbMEDgjKaRS16vAfoQ7FCf0
	q27ZGt+UppOdZz4wqeIst+TdRuXS/jSOdhd/z5pfmelSBDzUeN6CeNt7OGQZY54=
X-Gm-Gg: ASbGnctbWpLzpaR/FLzQp/75IvfVzMLzao2wHloLSadUGa4azUWq3szthlAmlBoQbXO
	CvjywF8oh1/QTrG4lV1GRxKd7FgtpfwdKps0xi5YWPzYJKdAfQ+YAbQ5RqUdM0zHSoenUcsiUDm
	7IbLBCKRQmQ5bpynxgx4jp/S4cZ5iQctgoHgDk6u7xBa9ttQ044YUhMp+o0ktGP4yUVVa3owYIK
	yNhnjMRdu+hkr4/KALUnANRXw7IID08lySInoPZTbvXZGUvwmHV+MG9LQg=
X-Google-Smtp-Source: AGHT+IHmdLCLVNBWI5BWwKKNhNvlrQ7mUVMYbsTuM9iwdeWGmXMlPqQG8bCfHySO5m70NUB4661tpQ==
X-Received: by 2002:a17:90b:4ec6:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f452e2e460mr3213467a91.15.1734676751857;
        Thu, 19 Dec 2024 22:39:11 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cf35sm4432536a91.11.2024.12.19.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:39:11 -0800 (PST)
Date: Fri, 20 Dec 2024 12:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] Apple A7-A11, T2 SoC cpufreq support
Message-ID: <20241220063909.hrqrch5fy44nywl2@vireshk-i7>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_223913_507973_69312A7D 
X-CRM114-Status: UNSURE (   9.40  )
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

On 19-12-24, 02:25, Nick Chan wrote:
> This series add driver support for cpufreq Apple A7-A11, T2 SoCs.
> Device Tree nodes will be included in another series.
> 
> Changes since v2:
> - Use NSEC_PER_USEC instead of 1000 as multplier.
> 
> v2: https://lore.kernel.org/asahi/20241212070344.3858-1-towinchenmi@gmail.com/T

Applied. Thanks.

-- 
viresh

