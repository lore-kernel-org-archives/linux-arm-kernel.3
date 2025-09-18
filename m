Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329B1CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=; b=eR/RZlXwadfXwjGM1kPfRY6ATL
	I3VvXmAEAbomWjHh42c8SX53kCQnpwNrCK0NJJw80HpOO3H0gaaXwx4bOk2Zn33VixRWEQ6YdoQ0e
	u/aZvuW1XZrqXEnBOa1b1H7xnFebRp/xyimkzcwVmOU2jPf+wIUYV2cp0FyECMof/fF2qWCt54+HE
	KdTvV/QnIA8WandvsgoMZO4UNYrNPr4m1dZPoNRqP0YphaPeWH/MdCUxdX2hph9HlxcOoeTHHkk21
	P8Uh2kKOZw5nBX1ZqcJhtameStCa/IA8TumIoQqy8uorjO+czLGKdDXPz8k5sQfvk+bjDJOZlgOB+
	qQrJ7xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Kz-0000000GSFM-3mV1;
	Thu, 18 Sep 2025 06:41:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Kx-0000000GSEz-1PNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:41:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2445806df50so5056605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758177706; x=1758782506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=I0YtE1JmYEgxElLEW63MHkuCg3qkkqryo0n+apsMTBayLVcejDK6EEObjNTOGYtVcG
         dPHzWFrJ+V/FMWDEwlVd8axHzIJdCIkypUDTWToc6QeHUKpSxiADnf7PNn2yAFHLGxiQ
         HDmgilqqUSyl1jtsU/VXwUyOaJ9TsaV8zbljga5Dif03YGw9WG8OPKXU6kif+qKG+eGN
         86jA8SdttpGvBA6NdzofKxRrNz/ABtj81SAo2qI3scSKmMcjbMQHC24RevM5udT/Ul0C
         /IX9ftNCggSaTjzNatqrF475qdgaKjEzCE+qegOr3gaePzCV62CeW+mOViZxiw28cHMe
         0+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177706; x=1758782506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhTbUPVJFOyAmNdzQk98ubzkzQEcGMZ5ZsZfB0f+IFw=;
        b=exObo8AcoHWZH49Csjf2YKB+4jJV/Mz/rvU9UiMw4+CuOdahxYICzfcLPzmI6DODbD
         u3WCH6GPVptx+0fMki+sKPFaERlYBpawmMAQCazl5doE8yrHcwCKZh6f9mhJHOg9KVHd
         9KfGTYpGbF4b4RDIBAZ5IMz9C2TtJ/L3zrHMeYYxf0MhtzJXBItzgLwWsplqv16YHdLt
         yIwMzrHxEezMbbCmSxM09meEisX7LAeoWtpfvcITUW8KzLHNJC29Vy5OSbgjwgqD/nSA
         D1g5mnyCnRG7AKRp/2KtdCjlA3QxAnDW/DEPrPR8h7fs7vB1IIFbbR0pyWxxK7bzncV+
         3agw==
X-Forwarded-Encrypted: i=1; AJvYcCXTQfUDUhO5OeaPuApzCJxEqi35S/zvAQu1aU2PuIB4+LD21MbM+CZ0izXQ3irextAragxcya0O2Z248HRoHrcR@lists.infradead.org
X-Gm-Message-State: AOJu0YyqeZdDxG7wKtvazFBlrSqMKqMIO4iAlqfV2izZnpk1qJQPmTR7
	J/Wde4XnN4DTq6dw1w9cvhaUbiA8AlqODzy3KsGeEuP6/nEJonHWtymmR+FXn97EdMbINSNBJae
	bDv1Pjc/YTxSIfIqHOBs1Fc/Tzxr8P4M=
X-Gm-Gg: ASbGncuVjS7+Xw2OevXmRIhYTOlTdGA8qvbpJj9omPYApkqTRYB11bxK8ssms5apRld
	mHyNRTGKOBGZMBpxeDeCW4mOm+31v+pRJrd0Ks+Jv27LDklHQoCXgb0+h+gGreaPdleX1FLfyS1
	sXXvYkmBQ1jFXPu71TG2vgFyPMfXNXUG5b/1l+nKBnZycNkBc4vKlGXrmg33HVhLoqoTQmjTAYz
	d03ldLbkuE+oO9daASTIPZu3xkR79z46d/J21P6prhkAASyYnlKrfo=
X-Google-Smtp-Source: AGHT+IEr8P+L0TJR3342JH9xYHQV3+Q0WGlxdbCLJmGp2Q+KPgwKRAcFBDBLv1ory2mNLCloivvxGbpVxzz0t7SLcf4=
X-Received: by 2002:a17:902:8f8a:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-26811ba5363mr43004575ad.10.1758177706285; Wed, 17 Sep 2025
 23:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 09:43:52 +0300
X-Gm-Features: AS18NWCPevQZqr-17ld4WpzvBigiHU7qwZn_PzyMsJ9Y7iuvJrnxcIFdLFQmdb8
Message-ID: <CAEnQRZD=1hxMmR98qfpoH_RFFrSrYMQ6ithFkjyqVgtqWKB_+Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_234147_396019_4307D16B 
X-CRM114-Status: GOOD (  15.71  )
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

On Wed, Sep 17, 2025 at 4:33=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This is the 2nd series to cleanup the driver.
>
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
>
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path=
.
>
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EV=
K.
>
> There is still a 3rd patchset to do further cleanup. After this patchset
> get reviewed, the 3rd patchset will be posted out to list.
>
> Thanks to Daniel and Frank for the internal reviewing.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For the entire patchseries:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

