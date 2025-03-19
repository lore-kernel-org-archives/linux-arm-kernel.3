Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=; b=R3dh1mI7AMqg/aa5VEl5t0/JN5
	98wtPpgF65grh/5dkXTaKosl7A9A9BUZgB/4w1CwvvVY/MC9aaLY9k+9NFYUd4Edeq8qlnrpBDWjO
	4CVKHMSCztjsc6VfYTvYMi/VkxCZ3IQCdFs7lA6NTkipVp9ifcqx04AVzoc7aca9ujqeS3uGOQaM1
	fMj+dlCI8JGN2Sx4d4eENDSn8N0kLa2bsvBAx6TH/V5GaWQCwPz5YfwaauSGKJ3MzglDElWhKhKqz
	TVofZnFXoLmnnXwR43XIClNtN6pKxOyU5dTYKry4PUhay9SqszYYdGsOAjIU52W7vIKoH/jro0l1p
	8m6MDW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tul1H-00000007yVO-31Pm;
	Wed, 19 Mar 2025 04:27:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukyO-00000007yEE-0lfE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 04:24:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so7625016e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742358246; x=1742963046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=JTmGfPqkx59eOME/EhrctoN393BdIsZKBaBaAFnfv1lzxVKK5RIAdRciCeoCt1PvGL
         hS/IrHN62gmIlhuVAvevcAGHblGyw+tTkCRLtLHJjXJeTcY8JpmACpyor2C080R+FXu9
         erzFyHXuMW7vKahK9zxfFNWqjAwp6QZAlQfxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358246; x=1742963046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=Kp4boY4Z5ld7UJzI3jwmkpJ1M6OUUqoFN6p9gwpaSS/rFsaRPGxeSG/5bS+e/D246a
         dgpmt4iQsZpvJOH15Z4y+4N9HQlXf0D6vuLIk8gj/EHAGluz8OgvsFAjnZQD6wtlqpR7
         Q+oTmBklCvko44TAE3KCobsAiL2ejHrQ/9DJ2k0bWfiL0f/X8AItPNz24jtVOoOm+TyK
         mDkSJNIXAzjCuShlvPDSZRSquEFpjO/bNJB56ej2zgl/Wsm9dK/jXZcVr9erWrvZ4wK4
         fho0vV6lkGWLsHZQjGH30eDkrd6qeOK2cttfqsOTKYAEd6+UrbFLEstK+EOq9x2BRcGN
         LEEg==
X-Forwarded-Encrypted: i=1; AJvYcCWuJPbQeep+nxdNL63zS2OF9wP8suskATH3zdQXMtDtZK07ljQ5xZGQQWINPe47RmuUuNp9H8B6NkLb5d7diqpa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1oeDD0td3RcVj/sgeOlRpwTE/oM0s5mr06YsngFOk+FdkAa7H
	Oj/UuvwUNrYM3lKqyCzyJKvP7pIUlHEfYh34c6QQSakz5xTrfhTGPRmbFHoTJdBa/e1p/ydnJuX
	5pbQamf0qFSRYmTXa6Vyssm/JF5yjLd/Xn3Wk
X-Gm-Gg: ASbGncvyNg1iscDbDhJxp5HbpkR4xTE5OTo5QTV2DJwzHa2X9idtw+OEs810bmUYjZ+
	hxJWwE5KmI5Xc+ehhu4vfxPrY3qVRTl6scf6N6KI7Or0xu4SCRKeSGXXV8n6MX9HMDFcTb//gPc
	At8L4MDbq9O7QGk1sYaIHhGAdI/IQFw4PgxLUDmJ4V1deaTIiSPqlZaw==
X-Google-Smtp-Source: AGHT+IEWZEscaVFUOUAsNjIprCbhq625oZrV53qjtBJsRwdVvGNmpIniSb7MX6P22AGKIV1DoFhBcxyYIRqcNBKHkLw=
X-Received: by 2002:a05:6512:2342:b0:549:8cc9:67d1 with SMTP id
 2adb3069b0e04-54acb2050cemr276298e87.38.1742358246305; Tue, 18 Mar 2025
 21:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com> <20250318102259.189289-3-laura.nao@collabora.com>
In-Reply-To: <20250318102259.189289-3-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Mar 2025 12:23:55 +0800
X-Gm-Features: AQ5f1JpqtWWWC0q87IWTa2_visyDIAAE7HlagkjknGbBQwFRTMIurzAoihaTquM
Message-ID: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	nfraprado@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_212408_225469_9A767413 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Different Spherion variants use different trackpads on the same I2C2
> bus. Instead of enabling all of them by default, mark them as
> "fail-needs-probe" and let the implementation determine which one is
> actually present.
>
> Additionally, move the trackpad pinctrl entry back to the individual
> trackpad nodes.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

