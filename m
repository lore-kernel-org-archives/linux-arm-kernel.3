Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4758EF54AC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=; b=mSXFAhFdfN8KUCNTnMCogegtvF
	q4xANnvirt7hjWgW4CcAICEdj6wuzoysmA6KbB4PE/WWYZs/UD2IiOFiVEH61zBmYMt2RsPAXU2ia
	KO1Q5cb6rMUUTIHEkNRV/lHeqPEDX9h/dHNhvuPP/nUEfj2n4o4UxNGQKsdsk68rLKV6ff0iAAMJP
	9rCkBUgzxsjbpehiMjUQuG8yCJjZBTrzUfIZ5cymNaMcBmghUDZL3AdQZ0uYYp+G4P4qI5m6EcNqJ
	ccikQv8TUv1+kHkDoiz5S2RTnMgzScTmrw+USa1XF7nR53efo8IDCmtkpWzyjBrow5RjYA+3emyQB
	Ok1XqYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53J0-00000001iHG-2v16;
	Tue, 24 Mar 2026 15:04:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Iy-00000001iGC-0SF7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:04:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a133b686f7so1544479e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364666; cv=none;
        d=google.com; s=arc-20240605;
        b=Irx0/rIIfVqtj4L8e3rMiolQjup7Xud/uSI36FmcxWji+o+chV6ynVmbyQpUSJtW3V
         UpyrFSG32LJDhL7foalTgSh2iuwYajLvjvOzW+mZY9o9PnyTs31vLFvJU128mNAjScWj
         r0uVqShvcZf/2m64CT+1vP0uommSAFAvBlcDjy+E6DBhyOCBuY1q1GOgkFrQPGam06mG
         /fNIGFU4yy9ku1TD3EJ5Ei8/Qz4Qu0XgPz2nsYrls+eoRsh3P8ljAMTMn5JBH51JkJ7u
         Jz4Q32Yf/WkTP0+WKuuTX4sXS1QXvJ1+oICOlgMgVZDyqm6bGA+WRi4uE8Rvd57ps+M1
         lssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        fh=RegxGokFNYGvMpl4OWHJOx9XNTpdPb7Dwzk640H4JmE=;
        b=j/U5ajoYrkQuFoJQbuJ5+ITxAtSKxr08lehjdDwVM1afCeD7rxWfzkWdSErCLwhWKU
         NwRcxzQ5HStwGNT7vdCV6nDgF3YT5Reo7MonzR2gsPo3s83u5TJ6t28kUEDlhfIIpF5F
         vpLQjjVe269lKriGnf7enDlVlOlh3qxG7R6WkMza7ma1aFDnRyrQqM5pp+GUBN117Zo0
         qNQAeJpvER9GX2ZOUOkXHfqB6XWxOb7yPuomfrh3kPlYdGNpSCtFIwDR6H0VUUQ7ItQ5
         zsRtEoOQpM0UJ8RVEDspOsMlY5cLU4IgoEvrvRh1OpTSIes5hs2A+tAtlhBnX9/P3mYp
         PoKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364666; x=1774969466; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=eRyCaCdswUs+rXgNLnqmq2SkKbC4LLcqbxQFDaws+GXBvF2CGzMQJ0lBkknCPy1kPl
         4q1m+EaI0/Tp+ssUNKMWdfeZNcJ4MuNhk2RmzsnWGbp8FTZZaZArz1Pq/zFxHGjEEA0T
         dxZKauwSZfXwN8wVmXo9ErtYEp/jvQEKAA500gisAZAFFNOXVXBeWRAAesPq0zdUZAEf
         J0/gBUnblGjy3a5JCwmsHRPvJ4vOxxI6LK7ecl4VrqxwQm7idvKi0hF4XBCRLM5vZz3C
         65kU8QNLbf31njKC1EZtK5Vl6F90AMqr1BlJ5MC4yN6WecWZz6N307s5CaFSilRUqMPU
         Giyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364666; x=1774969466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=cMXGG4r51gxBcRS/WgQ992LZyDnE7dmMtODH9SU4zg74YAcle1I6rtSPBUEW+nrGcH
         nPEc3DTwnuaDg/qigVZZxsELQ46jDVRq6sZgExzyUzpmUNeeGyTZ0pHZhDs2cQ+N8SDV
         nEQzjcP+YuQv9qiAxu5/pQj8BNFWJ62a2Xh1kZJWcvlR5XFunAR52Cnmx3Yy5AoV6qyL
         zRzvlOe+hNDzWFxA9qGb1XFzyVsswD+QmBI1bV41proq8YinsiVnRj3uQSsd/4vzXKfb
         9UoRPmrEPBME/n3f5cWQ50sUnuSgOaRs/vjaV1hw7MF39ChpH7b1PyvnsAeq2fRVWKGr
         t/4w==
X-Forwarded-Encrypted: i=1; AJvYcCVWXWSvLvU3JlwLPCwRDPTzTM0R9vnOHvzaNAJ4ip8+5+8EDSB720/lybZ6+ieyrpxZ0snv7SnbWNmETLTMa6fP@lists.infradead.org
X-Gm-Message-State: AOJu0YzKOSolskOSa/2K/9XGO69E7oPKNxmzWh4nF51f2wBwJND/C2jm
	mL0F7y8vNqIODl9Zxa9mg3QbOZvbnijCuMMhJrR5+Kqx8CylSvY1MCnqkM661OsfhX9wyvT3v8c
	FmlvXvsvtQviLbDsih6n9f8S/qbsrwfk2YZRuQGG1Yw==
X-Gm-Gg: ATEYQzys4bUTJpKQayhkN1P1p6WkaweZYlUjWoI4HYbLWqqJiDMK4j8v7fNTyohsyN1
	pSLsIxD2bJHu0gnHTm0vQlq81pH9CjqkOc/uYgshqBbsdT7SAHuXAtsBsZCqK9qpCwe3d4xPlF6
	ll7n4JYf2LQfvYYewb7a3sjxUe0qLSWPPohvrcDRGAHIJU62KblCbMFk6KwFBrRClg+hYCOsNc9
	YUW3cQYTeJK1C+2btCpiS1jUeTThtzlFvE0HsoOyNRh/ANhzbFgwcFqTo3XuCcn7oZoPPe3Pb4B
	q0ew8XFu
X-Received: by 2002:a05:6512:318b:b0:5a1:27b1:1e0b with SMTP id
 2adb3069b0e04-5a285b5879dmr5609526e87.38.1774364665808; Tue, 24 Mar 2026
 08:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr> <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:49 +0100
X-Gm-Features: AQROBzCPIbxWE8u1Ho5blhjIXaA43rjAdkegBcTuKwhyIBqFQ-RWFD1-u62lLKw
Message-ID: <CAPDyKFr5VHukeBE4Z1kVe-hUCFUCrw5roP=hT5jQC5b2X2fENA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080428_170918_8B31F4B6 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, 23 Mar 2026 at 10:58, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..40dccf9715781 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,7 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> -      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>            - const: amlogic,meson-gxbb-mmc
>
> --
> 2.49.0
>

