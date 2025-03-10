Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273F4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrA7rfUbhe2Pewgr5X93FRTG1RoQPZ5lbvHmNEd0rGI=; b=gsywEfeoZXhCx12wnQadChOasp
	nNUzS2wAmfG8CXCxQIwKauCsGrk6+vYAcNHlnA3R6XH5lvDx9Sfcdh6MQ0SA8hFjGKZQzmYxlv8/A
	8zWqRgSpn1H8yAJpuyQ/Et/iaNX2BS/DDMLsx59i7Lr6dfkWLXpQXvEAdzWljuHqoLRYgsMJcVdmd
	pT3V13O/rQhd5haQj4CB9PJqsTG9DuDMOed/oNCq9746q8dpXJQkDwaL+meyflsMWxfK5dcdSXtdK
	0nqcVBmcaTXy2sO7/4kRQL7kplg+xW5u6kKDhrNxXbeXZwyQ5ehs3RvrI+E6sOCKvhTvkgHge5UlD
	KoU622tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfri-00000003Kul-1DwU;
	Mon, 10 Mar 2025 16:20:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdRl-00000002pih-1LnM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:45:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso587242266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741614332; x=1742219132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrA7rfUbhe2Pewgr5X93FRTG1RoQPZ5lbvHmNEd0rGI=;
        b=WVzGMLrnQDxqzv/YymCe/Fl1lzsf7RsqnwBkYHCJcBRVj49uVU/QMxUtxYGL+jZe1c
         VF5ZLvJ49azhfFUSR2hfhzoYPac0hNXQmoFQ3ntXUUCyou8Skx0ZNJx5ZIPbpGLUOkKj
         KtyJ1kMIFQ2HBBVRINPLHs9dNt68MJU2LSxcCyIkMU1vNcWgZ//9uqPWSyRsr2j+dUhx
         ZC/O5GZRKHh1lJ3g5B9JD1qI8UXQur0IZ47Rzc/vUBhxzwAuOS2mS3/5I2hZ84l3VHIJ
         Sr5olAunUnxLp2hbRB4vbZ+OAMyTJDcN1gn6xa3EPHVFLskr+clSLHcAh3Tnq8kYW3Nm
         Lnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741614332; x=1742219132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrA7rfUbhe2Pewgr5X93FRTG1RoQPZ5lbvHmNEd0rGI=;
        b=HU8IHbwWsIq3yYydB93HhSpTiwKArx2kldxHelUnhC3h9+HcSEPF0m4T5L2r2kYvqD
         0mKdJ2Jvg9f/PocLZVgGYS9qOKbJwfc7YbPGKTGCctsZLnOCbOO8IZidwO6Im9YJSDBs
         NUNv2cz5rvdBdclKKA6/q4LLt7Qk1ehjVz1czzYOmWbBYv+9zKHNnju1GPw55pFFxLKa
         u6KIjkHTEKRiLUqxCUIBvuNnVrLckVOs1JCXQ8hVJrgvS9xF9pQm7HQWD6FCwqQAksj4
         0ltANnyLPPRJxeiYNXZeA/wPvfnhm9JEnKdkYp/Xw3VTf8YtZnhZYFnKJ0MzvphVg+Qh
         bAaA==
X-Forwarded-Encrypted: i=1; AJvYcCXSYIhRhzQ2A/LE2eCE8QL0+0o6uSugroP19mdX/ZcgVQfixwj61uKlOgphVtCrMKAmJay6PLlhZcFNYJeXwa31@lists.infradead.org
X-Gm-Message-State: AOJu0YweerigyT69d3jJpGwheYnrKF8AKUMgMBGuJbBRmMI1ASFOX/Mc
	nleChEW2jKTnDwp4w32ZNrbZx8yPfkd8P8ecjuxsVJBXIeugI7P76MD9VV04HiPbaFBRoY1ya+y
	ZdGVliBOq6fGdlJUSjZu5tmcRPtY=
X-Gm-Gg: ASbGncv1B0eqGJczlmy4S5o8vBBN2H8HIOsE7fQWG+BDD3tgbY7QDyHcI5UE1KAVPIS
	FQBqGIxpkonuhWUJi8MPgs6CC/ChIDraZMJsDMgyWjwDenccoxc45YlOiiNBjVpp6NmoB4dXeA+
	otIVt//E//c/mvX1Dm7w0RaWy4qqp9XW0jjnHuU405Nu2BqQbxfD2k42k=
X-Google-Smtp-Source: AGHT+IFrlV+UOZmk75f6ffZGqWNA8kEVBO9qwi1sfylUDo7SOrHnrhelQqcwKfQa9tx5Jczcf/SvJhuAPzOyWJApbV0=
X-Received: by 2002:a17:906:33db:b0:ac2:7b8a:7a24 with SMTP id
 a640c23a62f3a-ac27b8aa77emr821669466b.3.1741614331525; Mon, 10 Mar 2025
 06:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250307220304.247725-1-romank@linux.microsoft.com> <20250307220304.247725-5-romank@linux.microsoft.com>
In-Reply-To: <20250307220304.247725-5-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 21:44:55 +0800
X-Gm-Features: AQ5f1JqLOmSVWjJdyk8kWYqh8Q05Ls-ycUphJL8s1J0KBJmCwQzJ1qeS4exHJxg
Message-ID: <CAMvTesC+McATYa-xsi0omJ0LnFUUUooBk_r+oYSHYimyXPz5ZA@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v5 04/11] Drivers: hv: Provide arch-neutral
 implementation of get_vtl()
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com, 
	conor+dt@kernel.org, dave.hansen@linux.intel.com, decui@microsoft.com, 
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, 
	kw@linux.com, kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org, 
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org, 
	mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org, 
	ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com, 
	tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com, 
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org, 
	apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com, 
	sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_064533_381662_92BAABD1 
X-CRM114-Status: GOOD (  11.37  )
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

On Sat, Mar 8, 2025 at 6:04=E2=80=AFAM Roman Kisel <romank@linux.microsoft.=
com> wrote:
>
> To run in the VTL mode, Hyper-V drivers have to know what
> VTL the system boots in, and the arm64/hyperv code does not
> have the means to compute that.
>
> Refactor the code to hoist the function that detects VTL,
> make it arch-neutral to be able to employ it to get the VTL
> on arm64.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> ---
Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan

