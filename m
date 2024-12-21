Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB07FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 02:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99y9Gx8J1zxXZLANLv3H9dAUA86Q1c/9yGCSI8+WhU8=; b=jY2CsGfEbkyewB+iX8YeVoOg6r
	uH0fQefSDNVuyqy+gr3qtD+qSKgN6cOtRi7nyZqL9HPHk5kElWEw9ExBlb6qk0zNAo6GC874Q9lK9
	5pNiaA0Z0R6VKMsHYHZMSxk8CZcf+nO8vfc8lIDpni0edCSG8EyDkfSQqVCxCLaQ4lcs+Kb9PFpV+
	a/U9GUHaAvwlHLVvDyRoQZtAmJ8vn8SHkZP8s1RHB7Fhvcp62hJ0Wmzoc18imVeCt8fBJicWCiUJD
	yiiIjvbOIeXLJgwaSsDHRD4ITOMjIMBJAXTJDZ/Fb/0qOpBQTj0UrRtWZ0+443gENM8Yy+L5sOyGw
	YwhWP5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOp6e-00000006RWW-3gSE;
	Sat, 21 Dec 2024 02:20:40 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOp5S-00000006RIt-1qL1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 02:19:27 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5f2e2608681so1183153eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 18:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734747564; x=1735352364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99y9Gx8J1zxXZLANLv3H9dAUA86Q1c/9yGCSI8+WhU8=;
        b=HrRTTxqZBvR1PpAt9OHpo4a74wKcY42fHFoLkfisEaNLyoRIg0RBKl5pc3lykPsG2R
         6Fk4UbDCfDwpTQnXL+On36IZRRakD0+ilEHu22uEnACJpkogIpGVNqw4NthrS/vLtqRF
         Eb+mfXJ/MxY0+FGosAM4tmcFqqSasXWbz7PxtyWumTmUBy7Eq8FlrXcly+50rdLeWO+b
         oEEq3kgtPTBkimn8Nt230muqztdPvoBchN67I1y45YtnhRMtX1WeuK7rnitJ+qELW+LH
         xKlFUXZiCmRlpUWasjxY+RtJ7prMy3reN8bHOkUrTo+49f2F73k8x4cOWwSKppsCSLB2
         aFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734747564; x=1735352364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99y9Gx8J1zxXZLANLv3H9dAUA86Q1c/9yGCSI8+WhU8=;
        b=Fsrx9jjD6BQILNbYD4FTxeNjXMxOrTVEgWTaoSV0NPQUZi7Kx6svHjhG3IAWdU10G0
         +MPDEEHEnB0Evj1bcyN2kgDI1ExX4DHqK4zOzAoJtOrXLg3lWKjl+RHwbb54YaSW36Jw
         AxDarAfzHQCXXx99LYEebMf5/ztvCjTgNs8sgovQAlW9QFTiHeZoqRsWu5gOiuFhI2c1
         sWa/HDx9zU+CWtTR4S97L1yeau9l7Jr1T/mIK/x4nKVCfmrCdu+rRCaMzziWdWXJYGmb
         7wenooOPyHNtJl3YWztAn623CpmfPwyCltFr5YTnDF9lgKfOUYPO1KqR1FtMcpeeqK9o
         3Bqg==
X-Forwarded-Encrypted: i=1; AJvYcCWtlQetiB/Yrl9z+LvghRSd/CXX08qt80qZxTIQRP8/YHXm3tmE0PV33r/5m+iLV7uhNtUZXB1JaLoN+l+m6/wJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Zm3dR3CbkW0xp3cCINM0xmkHEQAiENdtAGEK1UvtLsO7Ralt
	ukWKlbX2M/hOQY6QfBIT6IH9ag7zRwumt2KI8LXmAUFmnFCaD4bGY0TpsLbxi7NZ6iE4Zn7pz71
	Y60Kq6aRX95JZdUk3skRrhRl93RY=
X-Gm-Gg: ASbGncs7C/iJkumkEzjwTJ+THghtElOyQAJHAQYX1mZyQPjQWoscevyaSJrD5k41K4p
	YeRYJKxuCnGkbNlSG1nJRb7BPJRZ9+jIppoyE+T8=
X-Google-Smtp-Source: AGHT+IG9p6et1FMSkfp7z6yuIUHa7COZ33lKNlvvXbakxbyS8JSwHcROiF1O8vCBbstSe/5GDdun5/C+sJ69wPoxTcg=
X-Received: by 2002:a05:6871:808c:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2a7fb00b537mr3084159fac.2.1734747564617; Fri, 20 Dec 2024
 18:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org> <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
In-Reply-To: <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 20 Dec 2024 20:19:13 -0600
Message-ID: <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_181926_485195_EB2B2DC1 
X-CRM114-Status: GOOD (  19.00  )
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

On Thu, Dec 19, 2024 at 4:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Krzysztof, Jassi,
>
> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
>
> > diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbo=
x.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
>
> cut
>
> > +
> > +  '#mbox-cells':
> > +    description: |
> > +      <&phandle type channel>
> > +      phandle : label name of controller.
> > +      type    : channel type, doorbell or data-transfer.
> > +      channel : channel number.
> > +
> > +      Here is how a client can reference them:
> > +      mboxes =3D <&ap2apm_mailbox DOORBELL 2>;
> > +      mboxes =3D <&ap2apm_mailbox DATA 3>;
> > +    const: 2
> > +
>
> Revisiting this, I think that for the ACPM interface mailbox client use
> case, it would be better to introduce a mbox property where I reference
> just the phandle to the controller:
>         mbox =3D <&ap2apm_mailbox>;
>
> The ACPM interface discovers the mailbox channel IDs at runtime by
> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
> specifying the type and channel in DT is redundant.
>
> It would require to extend a bit the mailbox core to provide a
> mbox_request_channel_by_args() method. I already wrote a draft and
> tested it.
>
> Do you find the idea fine?
>
Looking at v6, I prefer this version... maybe modify it a bit.

Even if you get the channel number at runtime, the type (Data vs
Doorbell) is static and needs to be passed via DT. You may have
  mbox =3D <&ap2apm_mailbox DOORBELL>;
and in your custom of_xlate implementation return any available
"virtual" channel. You could use 'void *data' in
exynos_mbox_send_data() to pass the h/w channel-id, instead of the
index of the virtual channel.

Thanks.

