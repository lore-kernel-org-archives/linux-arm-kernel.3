Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12850103E2E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH1mipQT29TxROf+s+KmsralPFytcWSy9wdT/flRJ/k=; b=ICDi6bGYWHecErmNM2qs0wvXmL
	xwHqPk7lK5CnFjPtDjIXmO/rCsDYV6zcIRSt8ZRjQLydIprvvAVB2F62JauTCaMAhTc25271FTM91
	Kxf0eN7xXKAy2eXSeRLiFC+85oCRoTscqmYvYRiedsIkQSnMxhByso7e+gaVw/LldsjC7Wb8kz95p
	i4p1jDOkqR7r8OjDWFD9XCD18GHA60vZvWhdNpp2Omm0VOozRz41mJ5+PDVYL4CKQUMP0lsLqFmkx
	biMXcZ72qhiZhYEkbOfurmrZp8Rc1fiDIcLbKVaVE9DhjsJKufUNXwbpriUX7igl/7lN8oDGJP2dv
	SFc6klHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RRa-0000000CZUo-0C7y;
	Wed, 11 Mar 2026 21:50:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RRY-0000000CZU9-2NCy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07F5860145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F1C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265815;
	bh=m2krFFJbAA0uEB9W2n2WCPL8P86DVDWnZTduVYzUqIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UWxX5Z78qjOx4LHQuEPYmjjcZhdJRQtgLXBdL/guZRXdrNpMI9whDGmxsevEYI9tR
	 de0QAg10xoTgUjlW9bSNODMWouh6YKIq62HkUkAz0PowJgJIe46wu8CcdBK3shQOin
	 QWi/Ssk2+zVwyIHEd/tQ+HWNcGknloUeq9NLTPLfdcMKKDxpBwBsaZXAsEdN7W8WfF
	 fKDI78XeYNxlrJewaxmmeFV4js65RpK+F84vd+4HicHiIwqnWtUsn+DdTp1Quf8W+2
	 C7/yQSQDQ9nck9iuk945LV2iQle2QVtoLgElpPnsbP3eG9nVPbStq0SzcPR/0sV8si
	 hDmUrpQDoMplA==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64acd19e1dfso402836d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:50:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+ctNOxoryOn8vFyMVuA9kJBqSYiQ9A+LvyC5aM/3CG+AnL0p2xdIs2HvhYckjlCZCMeJKs6GNvh8ujlSvi2oT@lists.infradead.org
X-Gm-Message-State: AOJu0YyXlyObtoDzupDqEHEntDHTcEetDVxkeB3GG5yevktDYFErSfKW
	xfUo2jpa38oDkVA15KfeyM9E7nJFFM9qulOUn8BGQ/Y1MEzrRx75tBGWw/Vz/eXCfUZjfB/ZRDS
	ARcihWaK9Yere4M0E0kjMmsVIfQwlNSs=
X-Received: by 2002:a05:690e:1b54:b0:64a:f138:3187 with SMTP id
 956f58d0204a3-64d65817d1cmr2757338d50.86.1773265814879; Wed, 11 Mar 2026
 14:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:50:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmajaTugcp2LxO62w0p+1+S6YRPfOT3BdCirrvN5RqymQ@mail.gmail.com>
X-Gm-Features: AaiRm53dpQ77aEmUV-pKlw3bjukzFCu41Gx2sWGVLP_b7CPBtnYAHiBxA564ABQ
Message-ID: <CAD++jLmajaTugcp2LxO62w0p+1+S6YRPfOT3BdCirrvN5RqymQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

