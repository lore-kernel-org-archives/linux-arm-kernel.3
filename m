Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6C8CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=; b=QQbgzikXSCKjqChcLgiroZdzOz
	NJuY1B7HdXTfLpw0j0iG5st4eK61kzrP5WbDOX34W+oijCZKSSYSGWnuNHFnVQA1cQ1NNfH3xDzYm
	iBCg4gQ7FsiWOogH1rTLam/dIlKNR4BJXtoWvjjVVxVtrpuc3o2OOxV4Xo38B4SWzqxK9EA0DOchf
	4ixG0/A+dxvCditrc40JM05vAICKXgF0B3Qbwosf3X8GP3gstdbuxb4OynV8huRnPVWqPdvzui7lS
	qK7DQv1TLttzUAxfCPjp8LWgUo7N411jnJaYxMO01fvuC2rUay8Mgv1/15N4q4FPy5ckKc8W10/SN
	OmdxmCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENMN-00000001zAU-4AZe;
	Wed, 07 Oct 2026 08:50:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENMM-00000001z9n-2dYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:50:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2004909f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363045; x=1791967845; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=f9XVtE1z50U6KiVS26uziOfzfDMsQ3tpRxS4QstUJVhwdCmWzZRrwsaqGLkbLZ4piA
         K8jwq9sWhDHs9AbQZFO2mgDf5H6rwAHGP8VW0bO8BCd1DI+98sHvo5ZMZJSytjTEzvih
         tzWUeRto/3da0kdKy7sLiB7VNfSga0hRWjBOaNw8cfdIAWdJLuh0NlxyJm/So3daYsVN
         JjGK+/6JTQvA/dpNbDgkhQHe5ygJ9/bq9IyLrzUGa3KbqDbakJrcQMguog3BFeZYfmJD
         U+SPKsBhJjpeOsi7MvaUYJGfLITWIM9/VFMIP8vjdG+9DYE/k140UwG4hVv5ZB735m+J
         FUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363045; x=1791967845;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=pZXn5Q9NtLxEJAzFX1wkVw1mUCb9VGsMpomO0CQh3dk569m8TTdlovP+ajoJKzb11J
         W/o6KASMT57Gq/lIG9nzHQErUYY5AZRy4dk4MGzR0BkHk4ad1sbVZQ8+KDUsPfASo3Rj
         WLKwRRUqIMqXAMZvk/aHYfkl6YAKC2W1EJ/rRJvO2WvlNG1jKNhaETRpB+erHnARz5EZ
         9vr0RG1sqKzIQPsSXx9vTE8ObnqfTsWYbPW34KyPyQff66K8Jcp4yEMrIHgxgXQUTxgQ
         4Lj2Zb9j6QLfSyNrwAyczXd9EbqoQk9u0FsAAbGX+uhMZpv2C9A/Lfr3OWKgKRVWCu/2
         ZtUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4FaANbTdkxqTGmo9Rkxc4To2trr/toLzI2mFs8YuRV2HMRaHKhn3E+ILlYTiTNYcgHzT0k9v6YAlmajQhdeNy@lists.infradead.org
X-Gm-Message-State: AFq9FYLp9f9bY233p7kdxvtF9YDMik1Aa4q1Lxdyvpnx6fnpID2pJOR1
	glidNpqCQJH8Sf/3eZuYYSkkBaRYenodA1miC9vMk64NX1FOBz15aF4M1U3KGLoPISA=
X-Gm-Gg: AYBFou1T8qOePR6GEIQaj/vUBXSoiS9nPeZzVj694vMIxM5qdy8K1xbtCV0T/Z6ecMb
	+7npxTl+t6PnBuVrgo9xDvsD9hhWomwvdHKWcjR9SYZph/8UxfKNeMXxWLBCXDzxxDErYDF3N87
	JOkLl40jUPJZFmuKFtuXWGOPxmsYDwtJZDoS+GPjiMXjQ/6GG1G7txrKo1/gATKMNLIIzMJuXnx
	iwZe/jJ+2DEhGDOPSIoB9TbCQ+8pWOb0KP8vxk0tb+vKl8/kuw8FxIzzS4Xr5JHgLDq7ur4VPsb
	D66o2BItTuV/Qilfgry5bTr0x/8JtZ5FT4JsasgXyiZG+O8JUC0fuJws64OHH+RHJzcIgNRBqrG
	IhPjz7B5sTo1cCbmOWPUTHhkLPkAz3AADS0UzodoRqJNhisfp8lrfaQ4EWSLXhQpk2tyMDqPOKc
	+YdRbMcICxygukavCPZhI3CWCUww6h6fDbWn2wW37vbJDfrSOkqvsh42vR7kDaOdshWP7Ly+8Eb
	24WLqavecVYesk=
X-Received: by 2002:a05:6000:46cb:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48c72787725mr1780822f8f.12.1791363044915;
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3050asm3959269f8f.50.2026.10.07.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
In-Reply-To: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-6-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:50:43 +0200
Message-ID: <1jzewpyjvg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015046_678432_4061A99E 
X-CRM114-Status: UNSURE (   8.23  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Slightly modify "gx_card_cpu_identify()" by making the compatible matching
> string an input parameter. This allows to easily support also AUDIN's FIFO
> with minimal changes.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

