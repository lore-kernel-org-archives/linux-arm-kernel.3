Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B8AFD461F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=; b=nZe8Ffb2/ItuL+k9Q3u8lkngWO
	mv1M/nSb/UvbzKHHzVzLlphakDTvOxDhQlBfH6yv3QdveCbvV5reE278TtXDnhqJq3/6BIJSSO9EM
	QsTiDUXXiRPTPxxGQqRRLMhjEsiviKfda341qiY94eVZiDZagKh71wY6AM/GxYStHVNPHgOXr/jHT
	GeX1BNQwzVIs5lW172cTDl6KspM46Zyt5PGM2W5p3JZJ5Jm/B2gy8RDTX+4UaqXrQDrMPytavicee
	jqc+uBHHkJGW531ru2FYIqhaL50APNCbmVPJd9tYRDcXyeO+YX95A6WxnT5QExMVfL2jiISJgEqXn
	8Yx8KL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVD0-00000005VwH-3Ys4;
	Thu, 26 Feb 2026 06:50:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVCy-00000005Vvv-0olL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:50:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so5960845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772088646; x=1772693446; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=;
        b=iAW+rQSDa19hCVpx+u9XQuBqifNgjIn6+eF0HEkfYeK/pP1CS2Kll/7+QubYSmapd+
         W5tUKcNtT/SWtEKsy/OkZy0vdn61FiH1bnd22BwoLK3RDHDUqnEyJGnHgoaLXS6J/efz
         OJFirQTjx0JahyCuhqZFFhyJsn7Pdv9MU8NXavKEGmL6qwEy3JAgiEDi4Q7/56mVynQl
         H3u0BhDlXEyozYAEypJ9m+j1+VREnd1PKgJHJLYfaaJ9Li061Bacc5gu26Op/xOCfQLH
         qKNk0NtaR8KrAtN1+b0KGpKCnXqsPbSvgRT/TnCFbKeJuqocEnYENYv+dF48w7M9Pqm7
         osSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088646; x=1772693446;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzgM7zmQUR0Nygxy2CGjYQcMUHvYZw/GgfIvFJp40ww=;
        b=kUdAPEmgDX3ylrzlPFQUBh1BbgdQsnhKmNt7+dMIkoE0F9DrqZBTybrzuej+j8nZM2
         3qmhbIfDsdGRvSWDqBS1gk9yK3N/iUXhyvAr2p6uRWcoOSifK3sAj49f0UTaBcVVGrK4
         2ZDEf+7F7yG+ryAv+KrM46RRG780b1DqNyZRRZt++7on7mEgFePfFWrJBHhoHZvAEaOl
         JQ3NHSHIqSIVtEac0IGJtUWB/r3EGXqDOTypNdI6wMjoNGN6zKzKkp8z//6UUdGJ59f2
         UTNHR0dqwof7B/Rhu9ZWbLHuVR8Gu7MpHWm3PBZ6CFjATBkEjLMvhOcmDedlL8ctrIdL
         rypA==
X-Gm-Message-State: AOJu0Yx8oHol/cgRUDswiVo+4EzHPmX99fWanZ/xt9TcbwCbgTSvo4o0
	Q7UyD+CicTHBi+Z/N0oFLdfBGEsONAVYE9BQUXaWXR/eSUCfuPbSxxJvAP5uEZJdG0k=
X-Gm-Gg: ATEYQzx6WiLEb3ZQbduDAtoGrCYzTgn9W9yOupJAK55iHvIwOGAEgZtL2oWY+DnQMpb
	dC6aBj4Amk4PbTvltJV8Wo0NETKoUMYeI/VwgyLHdXAANVjyJ7QIqr+eReD4txCRCYriu7jtdPP
	jnZuqr+5YBm+byY8D3fTXwUQ6b9HIBJTWDKvw3bWaGFvZ9n1w/LSYWM8EWNqREjXU9mjBvAX7ei
	orlWFhSwsyPHQYeGQc1/J+zg92SytgDKVN5Sw+EXRthCnNutWF148PEOI4qd8CR3t8aoyCQH9Fh
	OYOMyLLt0WV4kSSo7A4uy/YMd0iA7sdbeTyMh0jbb0svaNp2An+mvxLh8QVYgn7d7Mdpgm5tXiK
	nT8g3biVjVyFrKAdAnfpSQNa5hBauWMae3xs0BgtKqwIGK0LDM2hxlFbxyGk7aG4u3s8glLht/n
	QHNgZZxkQuIup13mve3yq98Fkn8JmJ7A==
X-Received: by 2002:a05:600c:4f11:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-483c3de3a31mr15029275e9.22.1772088645594;
        Wed, 25 Feb 2026 22:50:45 -0800 (PST)
Received: from draszik.lan ([212.129.82.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm22518055e9.15.2026.02.25.22.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:50:45 -0800 (PST)
Message-ID: <d8fe362e12af7a4e076babbca8a8be9b51f58ec3.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add supply
 and regulator properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Badhri Jagan
 Sridharan	 <badhri@google.com>
Date: Thu, 26 Feb 2026 06:51:32 +0000
In-Reply-To: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
References: <20260224-max77759-charger-dts-v2-1-983265ac8e63@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_225048_274544_D143C774 
X-CRM114-Status: GOOD (  12.99  )
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

On Tue, 2026-02-24 at 23:30 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add power supply and regulator properties to the MAX77759 pmic. The
> usb-typec device will reference the regulator provided by the pmic as
> it supplies vbus to the typec device when operating in power source mode.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> This patch depends on the patchset [1].
> [1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e=
9c@google.com/
> ---
> Changes in v2:
> - Added a line between property and child node as per DTS coding std.
> =C2=A0 (Krzysztof Kozlowski)
> - Added the "power-supplies" property immediately after the prev
> =C2=A0 property without leaving a line space.
> - Link to v1: https://lore.kernel.org/r/20260224-max77759-charger-dts-v1-=
1-b443545c04aa@google.com
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++=
++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

