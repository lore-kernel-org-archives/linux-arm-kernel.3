Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567EC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7bUxWyJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AUfxWgCj;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bOlSUyoj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=; b=R7bUxWyJ9txK+N
	pxZ8zRWIl7HP9QLenJZyi/ecH4Wv6rrt4eyBNGS1yuBw8RIh0ZXJrDd+Ey+ispIJZk31CcQHxooPg
	54VTCcljEueFxzkKZlbsh90DPRgCHEBXJvC8lryT56n/a5YTMOgUAUnKmltH5kXhOD591SIcEAmzQ
	poID3uaJtIGT0VnuYa25UXcBG/BdY+cQKv7pZKFNCSGRRp5mOfxF3jBfCDk4etgV2mG4nZ8cQsRjv
	KonfvskzRXi0W40BpqmHKHcr0P+6S8HJVUiE+bsLnBrwxd0BWav+VRroQUFzEJihxgEbJFFw3K50X
	l1mLZAWuph+f/0bgYl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKB-0000000GWdG-0JMK;
	Fri, 23 Oct 2026 14:32:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKA-0000000GWcM-09eF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 14:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=; b=AUfxWgCjrWAJszYxgi0ftBuy8U
	QykVwyrK+zVWDd/zpKrZJX2IM/nlrqHc03PbG/U6EcA0tcrut5kLFXTgeX7inYFdO05fQ0DADueNC
	0YMYHZRWc2/t5vpxLmWLbLQjiktkzVxawsLW4Lvw3xow8MHchDfym1Nhov/Z8ILeixFU1qL89Dl3s
	MAJqKAcjXjVIN9GfYoTGqzOWD2sEyHcFtMZ4vNQsQaI2dg9jad6RhxQdfTQ/MtmM4HZg1DkJrWRjF
	AIygC5A7mnQdub/LvU/EmK9faqDdIY8DpLTaoqXfcP+jEo6YZER8cnF9s3xNe+/LapQhTjnMKZmzA
	GdGIqSCw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGK6-00000009q8v-3mQu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:32:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dc202a60eso523445f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765964; cv=none;
        d=google.com; s=arc-20260327;
        b=RedS8PDIq8/CyakWJPSMe/LnZhluz99cIoha68QuZQcypDe/x/dA0IFIEUow2FR7EN
         urXwn2QRzmWAWMYi8wWEA/fY4vCa0x/O+41Pj+lB6yKAcPuWLkd6EzlHSohlxxJOsJrT
         9D/Lv7tYL5UO/HwWwW2xnLmsh60PPXGYLTTjaH/yKDRIxGfzDJMqUKGj2UpUn/RcUEfP
         alqVYeDB+37B568UhcMdYtw6vsjMO+oekL8aUUd+d2J1Yfm7AnVFDWWzmDid4vVUGy3P
         DJYFzUiFei2k5uMJh6GnpWnQ6mbaCeWu4it9gm+zyOt0ZaDy/6bMAcsICGMc5oY1ER7+
         orVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        fh=1iBOTiCE+Bx2Yvunynvyc8IzUHhODhQPZJaOfNvwbmE=;
        b=pROVpacdxNMBbUrMGnQrHEzwjtx+SQRCkekMpKCalKSf0ciQxVU/AdJK5Ge+AECE1y
         RUrPAtHaeEyLwaoq/WAgD7EEKkEvGDucPrIgwL9UQdPgYBje4QTuItl1gsBa7Q5w9G/v
         IgnfjZoBRmrTB3fYJMIc1400ISNmUnBkXO0dvranjtDbqjWpUy6dlJaVOmxdlhiMzy0P
         zQhPhpyA9dmRkakpYXFENpNcXNpBqhvJosv5YyINf4/219WJWtuwOZF2UiJ7cydz96XQ
         Wb7DtQpFk5D3Dg014iw2fVyf4DCcKj/anEMWkgSUeuU006vcwM0W/NwGo2bjek2HjsUe
         Kknw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765964; x=1793370764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=bOlSUyojALvxCl/0iTQjIpE+/1P8zWIUF4Ua+d8RmV9w3OICDQ6+CCvTjwsLBGAe9L
         IgjMPNY7bV6Im67Q96NlsxdH5WttEGiB1gz0oL19q048ql8AOxzrr1zrfdOUQJGp0+m3
         rhUxY8PZzMPz/seHLbzJujoDPGSlgKSoreqRTtBNRLk//gqh5ANvGWo+eW0kTIqtgfQW
         gezq0v557KGYg+yGau+NqRO2yLJtmeRyLI9v8tf2hmE3DNOeGxSNUNwAXV8bK6sDyFoR
         U74mMYDdhJNOnej83tQjCy0sW7NhZ3zih0Ay9xuQYpdPsBk9BUtlqqJvwhH4eUCOtX+6
         y0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765964; x=1793370764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRGGWRPBVtDZAA4r/kbSByT0vap6yffQdK6YCq0N6Tk=;
        b=gG0PZfe+xwJD9qDlE4MwhF7T5JAxJBUPMUjigkTMqFroYOy0F62Ba7rbAd5YMw0PJG
         68pHgMxD10Ee1+K4sDk8R1W72+eh0nwNWLv6huG2Al147HHdTff3xzRxwDLXLktLmoxX
         ZaZOUxYZtfgEw+zKNSPBnphkF5G3ekVlEd2+LeGFAydjcQPgKNxAe4YYhR+65LOs+pmW
         XECFs5JN6l99uTmY6KF3l5miiH8V0OGJSa+x5+9FBUtaGjBdwyCHGCSTdNDrCtveBmDc
         s4zOkT1rUIziYbv+MBlvAWO/Jw88Gnn+qCQECFrJbffbfX6hpzkczgU1L0Pfe/CTWw6n
         XFJg==
X-Forwarded-Encrypted: i=1; AKwUvBytBQi1yY/TCqJ1TFpaTW6LrQd4qSN0VUlrxrjVfvILCe/nGV8CztVAfqlNLgsqhO/liJAtiXXJi9i25MCLLmW0@lists.infradead.org
X-Gm-Message-State: AFq9FYLFbI+KM+ShqEf6ybgmFdepQNFHe/7+/L8XDF9aIYRwpv41W5IM
	SULxNqW+U6bpoyWJrlg42I9s4TSxEMQ/h962cePu0YiU2dfdAheScEzuXeLwr9g/cuAalVwGaOS
	sdcto6YwjO/V8u0ztawY9NcEwpBXIQtUzapG0/V/4Fw==
X-Gm-Gg: AYBFou05Ze/cX1vXnm66CBuOy3BlyBJv5QQb3h/b3NwpScKpM0HdNHpviyYHpckiCOx
	66o+QVa4nWm5dkP42YkCDCQiU5EEgd/TEWhIOwgjn19+UeziyCGcquyyOkQhdMrHf3N2mn6VJ7H
	CPIOTpwPNBbMIGgI1lGwWenbB4P3qNmEbdevYh2c6fWFil2dQY/nZuESrWv8jWDulgMqshgMokl
	XB6431JTkogJqrm4dhjAFb6ru+OGOQ3ZVKrlPItdkzYEncn7YKZ1mu7N+6DXH7TrfX4+8yplmnX
	Cwt+OLYmA1o5FOsTt1nAbkAcy2KglT1RN34KULqDVtQ3KzhFb0AsnAY5O+KKzx5TMiwdTZthKUv
	xqRQXXdyYwyG6tsaQdNeK1NzbmGp3Bux0s5XcWPclRiKxPcypxPTQW5NOs0eWCyVBMmF2ZxcR2t
	s8lhaa4kjVjF9YT38+rB6SRIXBH7SCcf1l8GDlp2hFGpFSgWDHUGvGokbC
X-Received: by 2002:a05:6000:98d:b0:48c:7ee3:e07d with SMTP id
 ffacd0b85a97d-48e385bfc42mr3907352f8f.52.1792765963409; Fri, 23 Oct 2026
 07:32:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-4-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-4-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:30 +0530
X-Gm-Features: AclHuK_j5l_mLkVqrJqA4yovkMFdDFBB6LDPnRF9bN2ny94R09y2JYZPHifdEPA
Message-ID: <CAAhSdy3rxvq4X=AFx8ps9dSwKR6Rw6M7m8ra9PEbV42tH9o8Vg@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] dt-bindings: riscv: add Smcsrind and Sscsrind
 ISA extension descriptions
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_153247_052663_DD0C707F 
X-CRM114-Status: GOOD (  17.69  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Aug 7, 2026 at 1:39=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Add the S[m|s]csrind ISA extension description.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-4-7909f863a=
645@meta.com
> [pjw@kernel.org: use official extension names in the patch description]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 16 +++++++++++=
+++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c0..ccff2be1224d 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -181,6 +181,14 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>
> +        - const: smcsrind
> +          description: |
> +            The standard Smcsrind machine-level extension extends the
> +            indirect CSR access mechanism defined by the Smaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in M-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -226,6 +234,14 @@ properties:
>              Profiles Version 1.0, with commit b1d806605f87 ("Updated to
>              ratified state.")
>
> +        - const: sscsrind
> +          description: |
> +            The standard Sscsrind supervisor-level extension extends the
> +            indirect CSR access mechanism defined by the Ssaia extension=
. This
> +            extension allows other ISA extensions to use indirect CSR ac=
cess
> +            mechanism in S-mode as ratified in the 20240326 version of t=
he
> +            privileged ISA specification.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
>
> --
> 2.53.0-Meta
>

