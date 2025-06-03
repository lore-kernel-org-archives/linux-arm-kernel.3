Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6ACC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQrYPrZTqU+W7SXR517k1BmM/NVQXlsC4DN3RfN8xlw=; b=gxDf8rs+2Jv4xyOQtAjy6V8TEW
	2IwondsPH8SkPH61y+1hfb61JiKGZO9vyVduKi+YB2C7lgsy06cu3ia6GkdpYwDGGfsc/KT6XoBc5
	FkThchEU8mYNYxVOdbWvnRb7KCCkhSRTkiW9T9NHoVX0Ntz9bN0Hjd3QIKDiaQwBNl0m6E6nAwbcN
	Nf1RrtC2MnnLhhspwRqxgHWrr2/8RvGSFDZWbNG7YLSUnc656gNOIRzlMG+imjgO7h4gkCtWS2TqS
	u7yv1RmK5w82Q8ypvgUjuZy5O+IoD2b8T3bbWHOuXgr/dgZxL2lL2rmW9DAh/NXrvvw1bebluCkpt
	wn1sbr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVPL-0000000BUGY-1rks;
	Tue, 03 Jun 2025 17:26:39 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVN8-0000000BTjh-0lVB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:24:23 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8085166e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748971460; x=1749576260; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQrYPrZTqU+W7SXR517k1BmM/NVQXlsC4DN3RfN8xlw=;
        b=Ln/LUmRdKhrF5f2nrl3bOzRHoNbo3i3XkXNlFeIzNbyxAYttOMHkCeFlwHBJX7kptt
         QbDOj1qmhbqBgwyW5oFjoLJ+7wAutYDfd1AOTnXQxKMQxVN2L8itFk7EEv4t58X4brMP
         qTPY5ZYZyfHASlEypZfYqC8G5FBm8CCvOKH3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971460; x=1749576260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQrYPrZTqU+W7SXR517k1BmM/NVQXlsC4DN3RfN8xlw=;
        b=Zz3Zm37Mh3Ai5qsRQpJNuS131aA7pBHaV3Lb73O1GkpDixodo2ux6WDCVWTln4E6Pg
         /Fu85Atpkk0Hj+SzTpabBoROfh7ugO4/8tXXSWMhMm3H5ZB1JURPbZfsOZWbH+FVb90S
         lfKX8tcXwL8HxBLcBt3nl9u5qEUChsAYLE8KIWW+mcS77giso2CBMOzcwcuX3Hijyw3t
         dQsCpuZmdn+SOUruUu4yVVjHb8TSs1z7b8y5FxVhvZgAg3MyvQePUqAvojnEbZCPAdBp
         aAs+1IpuCsEWInGWb0MBM8IzUAdu/bUen4LuayxerhYHm3cdlo1Q+TtHn+WFwe+IQ/CQ
         tBfA==
X-Forwarded-Encrypted: i=1; AJvYcCXceyjQkvJiyl8HGAbfWo23jf/1VNpY5O1lOElLMUCnQe/M1R8jLnTnc+abQBsABkQlN/gUcBBM1lsRZBYdWxAY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5WCYOZF5yW/c3dn8BZelHMR8zyX8YkUpTbgoLNLgQrZeCd4Tn
	bj4h6bVE1TqOlrsLs5cwL1SNGkaNyx098poUTYwmy9nPuMpGIFzxncvMCB1ZJlsex22bmdbUxch
	Z0Q/pBl69EE+1JxKyCy8ntKjuGiR2lefNL5u8eYBP1tiB6AILkoYKww==
X-Gm-Gg: ASbGnctmfcSU3J9dacRBISg7suvc8oZGXBR9pSF53lylxmQCb/Me1ZD0XXjuxnFnVP2
	fBDbr7W2446yph7fiZMMjtcIdqZ4LGV8uo0+G4qu+0IB1QJL6uK2+jy6OmwTREAlm4neNMa7atx
	/hL0Mttcx5+q/gbmaeDHgm2iKC5SNkT3MoBdrFEwnZwog1
X-Google-Smtp-Source: AGHT+IGzARlkmsLFe8IqifErjr36YJNusxpoOqBW1A5UcBCuiSPU7FVgDsrE4hxxtGGh6FMFux63RqWxMjpfY9CpgHk=
X-Received: by 2002:a2e:9a0d:0:b0:32a:6a85:f294 with SMTP id
 38308e7fff4ca-32a9ea8fcabmr35140791fa.35.1748971459910; Tue, 03 Jun 2025
 10:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-2-james.quinlan@broadcom.com> <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
 <2f79ae4e-6349-472c-b0cc-ea774b8ac7cf@broadcom.com> <CA+-6iNz48EFUGUOiHCSaqgsU_tKGV1=Xvw4fjoUS_AMhUHAi6w@mail.gmail.com>
 <3037cd65-89e8-4029-9ee2-4695db5987ad@broadcom.com>
In-Reply-To: <3037cd65-89e8-4029-9ee2-4695db5987ad@broadcom.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 3 Jun 2025 13:24:07 -0400
X-Gm-Features: AX0GCFvvKARwyaQBtcR5532V8B0V3nmib9n4bHN1lPiHgsNf2FZJwPQTx4BT8v8
Message-ID: <CA+-6iNwfxDMd5wpYZP3Ti6G6tdqHsJi2mFYTMOO0wH55CC_YQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009d5bb60636ae2619"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_102422_220929_DCB4D0FD 
X-CRM114-Status: GOOD (  14.66  )
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

--0000000000009d5bb60636ae2619
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 1:17=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 6/3/25 10:16, Jim Quinlan wrote:
> > On Tue, Jun 3, 2025 at 12:24=E2=80=AFPM Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> >>
> >> On 5/30/25 16:32, Florian Fainelli wrote:
> >>> On 5/30/25 15:40, Jim Quinlan wrote:
> >>>> Add optional num-lanes property Broadcom STB PCIe host controllers.
> >>>>
> >>>> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> >>>
> >>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> >>
> >> Sorry I take that back, I think this should be:
> >>
> >> num-lanes:
> >>     enum: [ 1, 2, 4 ]
> >>
> >> We are basically documenting the allowed values, not specifying that w=
e
> >> can repeat the num-lames property between 1 and 4 times.
> >
> > num-lanes is already defined as
> >
> >      enum: [ 1, 2, 4, 8, 16, 32 ]
>
> Right, but then we need to re-define it with our own specific
> constraints, still, don't we?
We do; there is the provided enum and we provide the maximum and minimum.
The AND-ing of all constraints yields [1, 2, 4].
Also, I'm not sure one can redefine an existing property or would want to.

> --
> Florian

--0000000000009d5bb60636ae2619
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICYDCC
AlwCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCQn8zLYS8ad93KTWQeG1c/QL/F8/28
Jvxa+2VBSAYofjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA2
MDMxNzI0MjBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQAjl6X1xHlcZTJs8Jad8bYR3wItkJgEYWGxnJ5jbOOrR7tRfBvbt2bl1dnD/PvcnbOA
e+qL9Q1dNVjOQpxdwdPqEhT/GS5zVNCG/n3jFcNp2sK5pfoa71roUU86bi8NMj+PtRFsQXNUtqwo
vCeIPfkFcY3v/MSGUwfaDPA0i1gb7jOhhBQviNUu4fEenC5IMn2/ZmfICnJsZLvZAQoPIYKTyt2v
xtHreyC4xM1JjtqTUi0iVlqFghge/l+mMyRsv4jiCowfUemMZGmfe61jhZJLV+HJR7twWhuPgdI6
OTvoxUjWmU9B87bPk0hD2xiIT3XL6VqtsG83FfxuHlBQtelN
--0000000000009d5bb60636ae2619--

