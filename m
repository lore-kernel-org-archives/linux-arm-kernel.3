Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239EBD78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=; b=w+W/9+gG/D5LdV9qnOdH2lWwTX
	UEPIMzZYqbx4F+CcO6W/JhgpdfRFrX+VL5CZcGcu9Uttd6XatR91hzXHb8Wq+xxOVBURnvev4utLK
	VEL0OvbCiXV7KSxHDKRylCNh0fBVFr9nWOCVIz/phfPzWS4oU/Q0hiEehzF0kuQOcAEY5LQiDHN+Z
	lwpERdqWXwYkQHn27CIArX4t/RVmqs4EXROf9GHgCYpDWXF13RcXkjB6LW5rTEBocF3OD7yD/6V7z
	T0iGKIwa9I/lXMsZxvt6WWO/kih8/NN66ulln9u+14KdwhVlYikZj9mIjpIxCnJY/G/4B8MIkzMiP
	pbqnVd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbvp-0000000ATC0-2JHC;
	Fri, 19 Dec 2025 14:58:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbvo-0000000ATBt-1Kjl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 14:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=; b=E9zkCaHpwv5ESkr7SiTya4mpNe
	Q2AqOmHyPYGAWIXhJ2DKYLRp6XuRixQX8dNulKbH2HpPfGIR47SyAAa1c1HYmwlc0YljblsjIvJPV
	zA3688mNMYPxsBvFpDfHUrpOqE6UVNDPKXbeBnwkaQT4M5oSPy0I2cjylZO9rK/OfQyrGZzBhpDLl
	Rzh0VW61klViLQ3Qh+4iXLUaHQwYU8Lr7rHGrYNXQcISCGNUYC2mOgodKv+2a5cxemOFDmztL6F0I
	ONan4NHGGyaHAmL4whhu5yclgohpHuTw5JsImH+jwYpcqVT8ny0avkNf+e0ncm0fq+lq5vrHD+WY4
	Ij7L63pQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWb4J-0000000B2Uh-1fth
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:02:57 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so577382a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156287; x=1766761087; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=;
        b=WEjZVlJrKA+3SAezE/+TnMdp/IYRtHmXuhXcA51iFjvQEJSC6liturXLUVyGePHigL
         HpC0JUgNmtm51muzlKhMyDy0dcdVcVcK+j+cuWcLFHjvhd7aJhE9IK3ClHZQIMmKQ8jL
         u3Zh/XlnrY0JOKIYrhXKcmT09hC9QdOf4nbh2HCFa8qf3BhTgt6oyUpoT09c7szRPsLL
         KXw/Rm2JUcuOyqVgb/V12Emn0riKn/MbBPoXE+U1nShrEH3lVc28NwIYDska+zLjE26V
         6CPmzU5H+uCwE1SGEyLL0JTZIqokll0DdgbWR62Or/YfDNzSbNzK03rcs/ffZm8dTJOg
         Ok/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156287; x=1766761087;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNc1dQiwRs9Ssf3LpIDfqsGZyzRfK4SH6H4kXeHx41I=;
        b=WnphQsEk79soUMuL9YanjBWyMXis0DSko2KoB/5GDOnym3W1lvZOR6Raq+xGepOnhl
         F53YaTPEek5xoq9xFWNrYo47bu4EDXWCTt7gDNvl8DSFG39LFvzPLkuyvJISHtcRrhcV
         f4KeCV3IVVD3T+GIgWn2ZDn4YbqiSQERHQ0jVjgvRXOo5cWAqvLNRItRmY05o8ciwKr+
         LLjDj4+vNGmHr7JjDFIs8BnY6Iq40cFlH34eg4HuiykcXX92WDeLn73DdP/nCDx3LaA2
         JsdZpyCFau2oPbYTiwLME0j1sI4NZ0EPPAEQvBinCSwa9aw5P1WgokqOi3jtlLj4Mftt
         1Jfw==
X-Forwarded-Encrypted: i=1; AJvYcCWaeo+Ve0F5xlJRdBM1jrVoxb4kKmL2Dm9IcHPQpKOJS/vPYC7w9m29UAsV/CIlrt+ObyJo1LBNJK+xD+mJPKBv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb0ua9lcvLjzNLpoRs5RkGlgkub1hmOfEFOzx2fcE+q7TJWnQf
	4KvNmlq34VpLnNfC/LQNZXR/VntSs1qomiL54uMxIF/e5AglOkKauVX2vk9CCay5oBg=
X-Gm-Gg: AY/fxX7HO9j+2QukLt6N4Lx1RlowbbrtZ3fA+7A1S7ai1eag4kZefH8mBDlMxVGZc+E
	XzKBWuJRQX536zgLFb/bNNwAQzcALUYThbwqojlyvCpotY9GouuSDyQkkra7u3np/S6FTs3Tz45
	NaMhB5+vGSNkz3Bu/XYHsX4ujXT3QKQmSvVVHE8XVVJl5rLnbaixpm/40HR4HhiHTQlqv6agHkv
	/aMUS0eA0PGkwEJdb27tPTtOV6erpl+p7pD3shkf39n9Y6526R256HAWrOSUOpnWxuV7Nn33Mlq
	YsC4EQJVCRPKqx97WiAgXibNe5ajjAlzmUyrOfbfJFH7e0NhVMztme7u/MKppHTftOAR0AWDWDp
	+IkKEfMXOoo3T8cmtRSmODVvBQj4cQoQNmV7jcjtIAXerhzDV6aLvvZIozQEzPsmef7GHe7S29o
	vi54ib8ztcWOxIfbzwPA==
X-Google-Smtp-Source: AGHT+IEDWLL5f2CK6H3TmqDNWHhuiGj1D56NMXG4q2PHWr/qeo6wGDL4ChtB8dXpxrxWSNjxO3/ViA==
X-Received: by 2002:a05:6402:5188:b0:64b:83cb:d93e with SMTP id 4fb4d7f45d1cf-64b8eb6194bmr2724166a12.20.1766156287195;
        Fri, 19 Dec 2025 06:58:07 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm2370855a12.1.2025.12.19.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:58:06 -0800 (PST)
Message-ID: <cda2b1668fd30cdabc9a0d722319fec4e0706c50.camel@linaro.org>
Subject: Re: [PATCH v3 4/6] soc: samsung: exynos-chipid: downgrade dev_info
 to dev_dbg for soc info
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:58:13 +0000
In-Reply-To: <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-4-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_140255_495228_ECEA9189 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> The SoC information is exposed to userspace using the standard soc
> interface. Downgrade to dev_dbg to stop polluting the console log.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

