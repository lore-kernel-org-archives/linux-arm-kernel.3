Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24659D29C4B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKh5VhKWJDfvZ+/kW792nGDNCXhsqOgN8MgniXfKmm4=; b=KiUilnLR7k+CC4gkj6YnN39n/f
	3IWLnprFvmu+3f2GcAtyBskQBIA5RTfhOC5ms+dqdLV5nfF2gwrkWGesdagrJRjXPZOd4hIolxz4B
	RX13v0LSN4lCdpdqQtveat2xDWmgk25cnu5wBURCIxdrPqh/GYIpvbpDMEKCYLEu0o8o1qtf0NSOp
	3q0x3X066vX5FQrmBE/XH7zsmnlItMR6xkjF6h28CC5s654NVUycK4cSDP4rcSwujqC9j2I+i0EPR
	DXsYLCHDzF7BDSYw+opT/YVVYsbFtRA8LAO3quNkQnYYUmh4WA3UonY9A3DOvAqaA/NrzKhpJSzr+
	4oANKWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsr6-00000002bmd-0u20;
	Mon, 19 Jan 2026 17:15:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsr2-00000002bmE-433W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:15:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0c20ee83dso41084565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 09:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768842952; x=1769447752; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKh5VhKWJDfvZ+/kW792nGDNCXhsqOgN8MgniXfKmm4=;
        b=G4MMtQc3z/BHnGEelaPUlGvD83p7BcI/llSnUhD84P/XqL99mi5K3jn7jiy/cAzIQ7
         TvRkTgRGdznPdWhKaU01NbGfjg6f4aLRKevc4B0N8oEYxyWl1iXiWNuvHIdIlVDYekyB
         z1C3Ysi07whXwja7PkBgymku4uMsd+LpvM2+RdAsVvAP3x0skpCNXO5xnbenRW1LlqET
         qLRZ8O6T7kztUdaEYgD2ynnwz7mB3HGAlnYupAKf+zyJyaYOKeq1SOOiqIfONY0rWYYZ
         9y2/DcjKz+g3xfW3AH0kf7/wbvDLi+vct8SuRpQTSY31mV3L1N1Dk3tKdp5HPE1amUbR
         HrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842952; x=1769447752;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKh5VhKWJDfvZ+/kW792nGDNCXhsqOgN8MgniXfKmm4=;
        b=FRSRmTWGRMV5YNFWbtNc+/nTKVEBB+isveY8llMP6qdDNqCVQDzbv92hcNeNVXPhwy
         aQdtF7A6x9e+yqw/7pIX/j2ef3liKbOTy39+3v/sZcfJnyrx1+fwCKE/WyeBybqxtR3d
         5Zq8dY5iLXlch2Ow0RS9pXvbkF6kypHAuOnJ8XeNdZcG80G2coUwmcr3TvvaKg8zhfaI
         Lo3EOOutwvCLaxRIwbcNuCj3ViJ3ddpyvzTSNSXv5/7Zs8ASyUKMAHq+XIfVkZdA4/v6
         3/nfo9ObCnoAGAZtbAHgjMNs2jt2ko44TSo3LjO6/9lgvr1iav7x0Qhe+RcEV72hfgGF
         HUNw==
X-Forwarded-Encrypted: i=1; AJvYcCUuhmvaRLeMD6g6aHHtOXE0M/z7i7WZYBB3NKm5Z01TcDbkDFL1Ev8I/daB84Mkv6mW3XVT7vcXeHXjoab4v5hC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz11rfv3Y2hhoPDRO3dXtV1R+HdzPlHWMSmOKNblKPfR5tnfQUV
	NNkMp/XfV/F7qlspp4nCEHysKFrWgfAlhtdxgKtfnYvcBLsaG0CPf7zFU7Se1qKy88d+GpdGWUv
	lx6CAiww=
X-Gm-Gg: AZuq6aLKsaHWcL8l3Rx4sAtJa4hqaKlftMt/a3J/lr48Mc4QzwV2eaI2J+sEHlWHTqm
	JmKSscYbdveIXGP7n+G3psA+tzCoMUEEcWLdGRVWRwmwZx4OUSeuFf/GGI//7H+sw9NJ5efMbEa
	1vB+dRr7UvpEevFYa0BpQKnlBppx8GXw6cWMdXtuj9HiIcJyREZy8ARxzNaB//xvWUmeCEFtE8U
	xl0hAqCR/4e4n75NqqzzGXgpm7bypYny7EapxrxU+bjl+IciV2SqjA/ICzfGHIHE2KftLrLrJJ1
	EdWMRSQynDXHKIkDUp6Bd0y3YBj2prLJIB4uJP9jpKEv3aSHsageXf46VNmSXLORLwgeARpRD6g
	zTF90e7aUvvdZAYTPMvUqLIeiS8tKq2A2VgwAAbqBWSUMYtGHZaPvCYjEA5NNj50Ia0zCLQTAn0
	ewD24qs2SOajgUCJ7K92FBt6pFfeEgVd/uE+jK6fsL6QYyrju/lalRBtsX+gBE+UEJTLRCbOA=
X-Received: by 2002:a17:903:24e:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a71753513fmr115578615ad.26.1768842951841;
        Mon, 19 Jan 2026 09:15:51 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa334sm46857445ad.5.2026.01.19.09.15.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 09:15:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
Date: Mon, 19 Jan 2026 09:15:40 -0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_091553_129700_EF08D769 
X-CRM114-Status: GOOD (  11.75  )
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



> On Jan 19, 2026, at 8:50=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 08:47:17AM -0800, Abdurrahman Hussain wrote:
>>> On Jan 19, 2026, at 8:32=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>>> On Mon, Jan 19, 2026 at 07:06:24AM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>=20
>>>> - of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
>>>> -  &num_cs);
>>>> - ret =3D of_property_read_u32(pdev->dev.of_node,
>>>> -   "xlnx,num-transfer-bits",
>>>> -   &bits_per_word);
>>>> + device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
>>>> + &num_cs);
>>>> + ret =3D device_property_read_u32(&pdev->dev,
>>>> +       "xlnx,num-transfer-bits",
>>>> +       &bits_per_word);
>=20
>>> Are these bindings appropraite for ACPI systems?
>=20
>> Yes, the Xilinx IP blocks are memory mapped and work exactly the same =
on ACPI as they do on DT.
>=20
> That does not answer the question at all.  Is it appropriate to
> configure an ACPI system in this way?

I am not sure I understood your question. What do you mean by =
=E2=80=9Cappropriate=E2=80=9D?
This is following the same guidelines as outlined in=20
=
https://www.kernel.org/doc/html/v6.7/firmware-guide/acpi/enumeration.html


