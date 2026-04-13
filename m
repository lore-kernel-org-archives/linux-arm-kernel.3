Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5ECF34C5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9dPDvYBTw9HdYMdZ/a5T1qVs23laCgwvQcsbGk2Rh0=; b=t+qKer8RKmtY8Ja/JItIztqgx/
	7OTSGj8XhsEQ/RcDrQpre881f8m8X+LjCuIXD59qQ/agxvhxiHbS+qcl65/ZhySrSF+EWQWPlF3Yw
	dPjEm9n3iEUqNOuk1oXmFF85GpQpvo69snJOvk1UF3TTNBaeIXuZ8M/8D0IYACtJ8o2G1IUfyjjDu
	wrx/Sdc8TRFyFgXFuX7P6rxw9rPT+cinO753zbFVedNxNOH+TfhDxI9oese5Sh2BmfnOIuHbBmT7Z
	u4b6R55v8zVJ9UcoDMRXBK55EzH4P2hyv0ScwwdRSC7jRkMIe0m+aV3/3HRQhcbRPtZCQfdO4OSVj
	G044HY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIkP-0000000FufM-3bSj;
	Mon, 13 Apr 2026 14:58:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIkM-0000000FueU-0HyL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:58:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so4549928f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776092319; x=1776697119; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J9dPDvYBTw9HdYMdZ/a5T1qVs23laCgwvQcsbGk2Rh0=;
        b=iixbaVPQSMaKSIAq0TQceMqq1x5dFj3yOYCgfhLdHkxQRQOKmE3tv/8l8Xh0dcG/WC
         gWQwwoQM/ZLfIKQvi9xB4SVtapco0QdrZtODt30VBL0GjmiR/xOljEjLxPezpIPriMQM
         jfoUkNqQLs3l0zND1QDw/NCkA65Ozt+dd7UtRx3f3njZ6BGOr75WuN2t26QMLCfyWVu4
         BVN5uDXnIxCjEF0UeLCrD8RzJCmHp4AYio0q90dRW8vB/OR1PL+bOE8VdMjXP7RelkXi
         RTNquBovaQuHbn/bET+ewd85qPO6hs7XxRvYNcvFVmPLd1AgqW+E7nH4h3kdpDRvsEkJ
         knpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776092319; x=1776697119;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9dPDvYBTw9HdYMdZ/a5T1qVs23laCgwvQcsbGk2Rh0=;
        b=knNKHC3u1aAD0YMw1JwQ5tK1iOfjcODb3ffLDazfx7mRtFyfuZ2DH/3DNPet0Dx5BX
         l9VCPCCw4rXBL5va5tBw/idksFCKdz7JT0r2HP4w10Ri2g5lYgJKBU4Swk/U/9gGnZY4
         yCbtzoMC/kQDaiyVNq+yz7k+TZBLTA9A7e1g4aO//QO4N+KYk2BOcIkGSBg2L5Ff2ZTs
         kpPsgpV1cYUeCZGYPETa17ZPdsb0VpI+jBXwSdmzbMH06kjf7unmm5wvibnZCOFQb9SQ
         HRKP4Dcmuz40eMtttmlq5IHcJZCAlXLIpvMDOVbcA71TU8cywjwTc9eR+oLr4dYI6jfo
         hlyA==
X-Forwarded-Encrypted: i=1; AFNElJ8s3v30bAh8GLJWFSqZ83rwylxJqRnvd0MP5CPmkTyB+zCVwfKFK3ocIsoLwf91TFWKWAAcLaoxPhJW1PE/7uug@lists.infradead.org
X-Gm-Message-State: AOJu0YxU9CBvfT+4P9rrj7hjjt4LbnXf3qH2q3WvJ+e3Um/EO7/xjdo1
	0JmVS1GimN83PPbIOKC3y4P+1zp43FZELiAS5LEs4/12KjWIy/rRHqY/I7125KVYgtw=
X-Gm-Gg: AeBDievkNsGwaX33OUzbkYBZ1DNKusRv1gug7316bLq/2F8VDWtq4vJ9/D4UT5v0Lui
	NPzdlp5jqf6UPw+7g1yqNqr1f2HmXx/bTFxG22lMix9862/NchekSYcQbtzyZCY24Iwt/yH/OFh
	AL8gf/UwJ1hsvXPy4NBNbAZM4+UAC4gILQjGqM5ivXZwzqb0OC/+51B2k3vvO0bWHTyCJPIRweR
	4MXv08zbtnM7KN1Zixzxht2inJGNTFWigwSTRdBKM3NqVxwBE+rsx5z+d5SKA6pKqmpk31oz2lE
	Hmjf4QBMqTTjBZXECCPy8G3fo9mIaKTf7oa3iTosdudw91FUx065Ne4rwtkPmz+wIETwDWuVu+C
	bsiHagERXbkFAnH6CUYFMP3Gzx2fXcZVXk8ZSVqr9fDbAwXZ/V7ECTlD1HzTlswRSN0+nsBb6vY
	QhdQgbQIoEpSsh2rM=
X-Received: by 2002:a5d:568b:0:b0:43d:6a0c:9571 with SMTP id ffacd0b85a97d-43d6a0c95demr10556355f8f.11.1776092319396;
        Mon, 13 Apr 2026 07:58:39 -0700 (PDT)
Received: from localhost ([62.246.35.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7bd2f237sm5888815f8f.23.2026.04.13.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:58:38 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 13 Apr 2026 16:58:30 +0200
Message-Id: <DHS46FH9ZYZB.3BG6HVH832NAE@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Suman Anna" <s-anna@ti.com>, "Nishanth Menon"
 <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com> <8673745d-aad2-49d3-b3af-556de7037b69@ti.com> <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com> <c35fea4e-dc22-4314-9c5c-bfa5b880864d@ti.com>
In-Reply-To: <c35fea4e-dc22-4314-9c5c-bfa5b880864d@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_075842_129579_EC75BE93 
X-CRM114-Status: GOOD (  24.16  )
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

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Sat Apr 11, 2026 at 4:47 PM CEST, Vignesh Raghavendra wrote:
>
>
> On 10/04/26 19:12, Markus Schneider-Pargmann wrote:
>> Hi Vignesh,
>>=20
>> On Fri Apr 10, 2026 at 6:30 AM CEST, Vignesh Raghavendra wrote:
>>> Hi Markus
>>>
>>> On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
>>>> Split the firmware memory region in more specific parts so it is bette=
r
>>>> described where to find which information. Specifically the LPM metada=
ta
>>>> region is important as bootloader software like U-Boot has to know whe=
re
>>>> that data is to be able to read that data.
>>>>
>>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>>> ---
>>>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 ++++++++++++++++++++++++=
+++++++--
>>>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot=
/dts/ti/k3-am62a7-sk.dts
>>>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9a=
c5bcdff745a9559a89 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c80000=
0 {
>>>>  			no-map;
>>>>  		};
>>>> =20
>>>> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>>>> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>>>
>>> There are still references to wkup_r5fss0_core0_memory_region in
>>> k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches a=
s
>>> well)
>>>
>>> Dont those need to be updated too?
>>=20
>> I only updated the sk boards as these are the only ones that have IO+DDR
>> support that I know works and need the new memory region layout. But
>> thinking about this, updating the memory region structure shouldn't be a
>> problem for the other boards either, of course I can't tell if IO+DDR
>> would work on them, but the new memory region layout shouldn't break
>> anything.
>
> I am not talking about updating other boards, but specifically about
> k3-am62*-ti-ipc-firmware.dtsi which have a phandle reference to
> wkup_r5fss0_core0_memory_region. Therefore any dts trying to include
> this dtsi would fail to compile post this series.

I am not sure I understand why they would fail?

The current design is to have the k3-am62*-ti-ipc-firmware.dtsi files
reference the memory regions in the r5fss node, for example:

  &wkup_r5fss0_core0 {
    mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
    memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
        <&wkup_r5fss0_core0_memory_region>;
    memory-region-names =3D "dma", "firmware";
    status =3D "okay";
  };

But k3-am62*-ti-ipc-firmware.dtsi do not define these memory regions.
Instead it relies on the dts files to define them. That is done for
example in k3-am62a7-sk.dts and others.

This patch now changes the memory regions being used by r5fss0 as well
as the memory regions being defined but only in k3-am62a7-sk.dts. It
does not change the references or definitions in
k3-am62*-ti-ipc-firmware.dtsi.

So I think including the k3-am62*-ti-ipc-firmware.dtsi file should still
work as long as you have the memory regions defined in the dts file.

Best
Markus

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCad0ElhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN9
/wD5Ab5i95liHETc2NOhXhkDKA1xYvzEVvaeIFg98GPhbA4A/3L3/LhrHSz6dGz9
qBvd1F0mm4iVotX0AxZJ4Rm3YZoH
=SQ08
-----END PGP SIGNATURE-----

--0a785cbd2c7f90d7885fd7b41f2dd71fdce8ca289150b6b9839827a32df0--

