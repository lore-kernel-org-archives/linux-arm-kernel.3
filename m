Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEDDC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UENFYNOoNWpjIcdHl6EeeyZIE3QIPB2VQaDR+AO/Djo=; b=ADCkkNDg6VL8j/RJWOTOf+yzq6
	29whAOgYW5SkHEZsLKXMxzpnL9mnIGCvtadL4i9Lv9reAfajUU82upGfAhTpXVfusO38t33lutGU2
	uQc3gaVH2iL3PGsc0ozcswsCRykdpTAT6OqA/dWiaSFmN1yKBmWFugG6YkttRsfdjDoIeZGBov3BI
	wf1oA+giPFc04+vWFn3IavLnio+2CQ1X1uo0oD6g6O/G9iMKV51C44Zxc4VJBgxC//cGLJnF8XI29
	l58ah8aZ81MhhCjdibHZAwZWj8ZJ7DcDFDa8txbrDlHFuoAmtFlZfqvbSjU2mgfSxtRyoNEIOoVwE
	87tb2TIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXZC-000000042az-3AlR;
	Tue, 15 Jul 2025 04:46:58 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXMb-000000040ua-42U2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:33:59 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b3a3a8201so44772881fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752554035; x=1753158835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UENFYNOoNWpjIcdHl6EeeyZIE3QIPB2VQaDR+AO/Djo=;
        b=iTyD1foAQ/WzAbEhknTB4OYijpW23uH55yIY2zfrYparmBwdAXrY8HNHKQcE1c/yKm
         nxbenasUB6jvWGnJv9Ab06hOMMYscVUYUytYN0iNaxZ4xEm+QNO5ESs3VFm4A9fPBM8n
         xU+jnGsEwkaMqsKd5fJ8XlfoATTFsuPnshaeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554035; x=1753158835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UENFYNOoNWpjIcdHl6EeeyZIE3QIPB2VQaDR+AO/Djo=;
        b=O9ubAc3KP+gA1Um+de6zFqrONhhT/cbkOVexG/li/E9EtdqjEtsKhUXZRO/SvcuubS
         a87KINa+PPq0Kea5K2j5a8g4ciXx634BPonkXAGw4YO/zAUpKbVRGF0uDDgmX9IiFVkm
         k5XgQBA5dD3cg6q9IX/mbkg08hMn6bW4TBJfeZLGyO+OjXyHQ9OTxwPUuzaSFphf4DeT
         j9qklrQccJARbM6m1kIojIA3MTCwtamXnEE7pORMDxDIgYFAGiSIn9rPR1CC/iDh2bWF
         7liUwdutO/Rb4NlmfEunUx6yUdRKDyJo0m5+9UKa3tdd4AHtPanNpY/1lQ+73YpE6cju
         F2TA==
X-Forwarded-Encrypted: i=1; AJvYcCUSVVGAGbXpZuvXSrj+Z0F1AI0QGWLjFGVmpgCjSqbY0uiDDE24T2lXtCLR/yMmnBHS0waAWxfwWwoASOlrpNDM@lists.infradead.org
X-Gm-Message-State: AOJu0YwBa6N8Arr7UAHfEx6Nic7n2A3e8Uoe9AulA+q7hb5aHH6FS2mT
	eAtXwjEjKo4wwjSh5FbypScLAbNRGiu6yPr1iFn7qiy55Mu+Sigl4H66wkYByVHhvg2bf8j/L1k
	3mFfwhPki2O7DE6GgpNkCpaMfQRZG8mq4FfAsBgre
X-Gm-Gg: ASbGncubq9pKBzSUKw3b/UBDwiGzfXaM4cGr514MzWoaaMrxMmlnvbTfMLxJupprMic
	vyVBqsZSlFlcp0fEjRvsoCVQNa/L5suZldxwA7aNnPIKRobAZkUkp0KJz9jET+JZRfr/mxbBECq
	VVx293F2Ecfx1R5uuclfwviocN24VisGRaVG3cI5KH+HzpuJK+cRV/oCpEnORV6/uwp8M3iiCKX
	JcI4CjeFO0kgX0/MPLbNBoVrMYmul3VLLY=
X-Google-Smtp-Source: AGHT+IGT42IK43/qmuJkYbs0B4NDx4DnQZ7A6On/J08wsMTVxqrrSOxinBGIjC1Xv+05ywz7QVbCGKdiqwYy49BtWHU=
X-Received: by 2002:a2e:96cf:0:b0:32a:666e:9f14 with SMTP id
 38308e7fff4ca-330533d4946mr36098621fa.19.1752554034785; Mon, 14 Jul 2025
 21:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <9560d4d2-5346-4d0a-a96f-c96ebe335f3c@collabora.com> <20250710141941.75843-1-laura.nao@collabora.com>
In-Reply-To: <20250710141941.75843-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:33:42 +0800
X-Gm-Features: Ac12FXwNcWWWFDsXlYNBMHE507zSJPdaLhNF9Htt5k2XbSwWXHodlW0LQNdN1Js
Message-ID: <CAGXv+5Gzk2hDYFWTsN6V6LOfNyfrYg1ZqhsUHfTJMpOWh6f9ew@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)
To: Laura Nao <laura.nao@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, arnd@arndb.de, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, drew@pdp7.com, 
	gregkh@linuxfoundation.org, kabel@kernel.org, kernel@collabora.com, 
	khilman@baylibre.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	m.wilczynski@samsung.com, matthias.bgg@gmail.com, nm@ti.com, 
	pjp@fedoraproject.org, quic_hyiwei@quicinc.com, robh@kernel.org, 
	tudor.ambarus@linaro.org, u.kleine-koenig@baylibre.com, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_213358_045628_22EA1D11 
X-CRM114-Status: GOOD (  52.77  )
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

On Fri, Jul 11, 2025 at 12:28=E2=80=AFAM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> On 7/7/25 12:40, AngeloGioacchino Del Regno wrote:
> > Il 03/07/25 10:56, AngeloGioacchino Del Regno ha scritto:
> >> Il 02/07/25 08:50, Krzysztof Kozlowski ha scritto:
> >>> On Tue, Jul 01, 2025 at 05:11:48PM +0200, AngeloGioacchino Del Regno =
wrote:
> >>>> Add documentation for the new MediaTek Hardware Voter, found in
> >>>> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
> >>>> the MT6991 Dimensity 9400 for Smartphones.
> >>>>
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> >>>> ---
> >>>>   .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++=
++++
> >>>>   1 file changed, 70 insertions(+)
> >>>>   create mode 100644 Documentation/devicetree/bindings/firmware/medi=
atek,mt6991- hardware-voter.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6=
991- hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/ medi=
atek,mt6991-hardware-voter.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..173b74c23a91
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-har=
dware- voter.yaml
> >>>> @@ -0,0 +1,70 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>> +# Copyright 2025 Collabora Ltd
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardwar=
e-voter.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: MediaTek Hardware Voter (HWV)
> >>>> +
> >>>> +maintainers:
> >>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> >>>> +
> >>>> +description:
> >>>> +  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-functio=
n MCU
> >>>> +  used to collect votes from both the Application Processor and fro=
m the
> >>>> +  various other remote processors present in the SoC, and transpare=
ntly
> >>>> +  turn on or off various hardware resources (for example, power dom=
ains
> >>>> +  or system clocks) based on aggregation of votes done in the HWV M=
CU's
> >>>> +  internal state machine, therefore guaranteeing synchronization of=
 the
> >>>> +  hardware resource requests between all components of the SoC and =
hence
> >>>> +  avoiding, for example, unclocked or unpowered access to the hardw=
are.
> >>>> +
> >>>> +properties:
> >>>> +  $nodename:
> >>>> +    pattern: "^system-controller@[0-9a-f]+$"
> >>>> +
> >>>> +  compatible:
> >>>> +    const: mediatek,mt6991-hardware-voter
> >>>> +
> >>>> +  reg:
> >>>> +    items:
> >>>> +      - description: Address and size of the Hardware Voter MMIO
> >>>> +
> >>>
> >>> No resources here, so this should go to power controller
> >>>
> >>>> +  power-controller:
> >>>> +    $ref: /schemas/power/mediatek,power-controller.yaml
> >>>> +
> >>>> +required:
> >>>> +  - compatible
> >>>> +  - reg
> >>>> +
> >>>> +additionalProperties: true
> >>>> +
> >>>> +examples:
> >>>> + - |
> >>>> +   scp_hwv: system-controller@14500000 {
> >>>> +     compatible =3D "mediatek,mt6991-hardware-voter";
> >>>> +     reg =3D <0 0x14500000 0 0x3000>;
> >>>> +
> >>>> +     power-controller {
> >>>> +       compatible =3D "mediatek,mt8196-hwv-scp-power-controller";
> >>>
> >>> mt8196 in mt6991 is very confusing.
> >>>
> >>
> >> Yeah that wasn't intentional; fyi, it's almost the same soc, that's wh=
y I mixed
> >> them up... :-)
> >>
> >>> Anyway, this does not address my comment at all. You again create som=
e
> >>> sort of syscon for voting, so no. You are supposed to use generic API
> >>> for voting: clocks, power domains, interconnects - whatever is there
> >>> applicable or necessary.
> >>>
> >>
> >> Making that loud and clear: Interconnect is not applicable.
> >>
> >> The only way to do what you're proposing would be to add a bunch of `r=
eg`
> >> to each devicetree node for each clock controller and each power contr=
oller;
> >> I can do that, but looks a bit dirty - and still yet another syscon-li=
ke
> >> alternative, but without having a real syscon declared in there.
> >>
> >> Mind you - both clock and power controllers are writing both to their =
own
> >> register space (and enabling external regulators, etc, for power domai=
ns)
> >> and to the hardware voter MMIO (which means that the HWV, in hardware,=
 is
> >> fundamentally broken).
> >>
> >> After this reply, the only option that is left to me is the following:
> >>
> >>          topckgen: clock-controller@10000000 {
> >>              compatible =3D "mediatek,mt8196-topckgen", "syscon";
> >>              reg =3D <0 0x10000000 0 0x800>, <0 0x14500010 0 0x48>,
> >>                    <0 0x14502c08 0 0x24>;
> >>              reg-names =3D "base", "hwvoter-base", "hwvoter-status";
> >>              #clock-cells =3D <1>;
> >>          };
> >>
> >>          imp_iic_wrap_north: clock-controller@13c30000 {
> >>              compatible =3D "mediatek,mt8196-imp-iic-wrap-n", "syscon"=
;
> >>              reg =3D <0 0x13c30000 0 0x1000>, <0 0x14500000 0 0xc>,
> >>                    <0 0x14502c00 0 0xc>;
> >>              reg-names =3D "base", "hwvoter-base", "hwvoter-status";
> >>              #clock-cells =3D <1>;
> >>          };
> >>
> >>          /* Power Manager with Hardware Voter */
> >>          spm_hwv: power-controller@14500218 {
> >>              compatible =3D "mediatek,mt8196-hwv-scp-power-controller"=
;
> >>              reg =3D <0 0x14500218 0 0x20>, <0 0x14501410 0 0x20>,
> >>                    <0 0x14505514 0 0xc>;
> >>              reg-names =3D "hwvoter-base", "hwvoter-status", "hwvoter-=
ack";
> >>              #address-cells =3D <1>;
> >>              #size-cells =3D <0>;
> >>              #power-domain-cells =3D <1>;
> >>
> >>              /* SCPSYS hardware voter power domains */
> >>              mm_proc_dormant: power-domain@MT8196_POWER_DOMAIN_MM_PROC=
_DORMANT {
> >>                  ..... etc, all power domains
> >>
> >> At this point, I'm really not sure that this would be better than just=
 passing
> >> the mediatek,hardware-voter syscon to the clock controllers - as what =
I've done
> >> previously was effectively representing the hardware in the devicetree=
 as it is,
> >> matching the real HW layout 1:1 (because again, each of the whole HWV =
MCU(s) are
> >> embedded into each of the two power controllers, one for System power,=
 and one
> >> for Multimedia power).
> >>
> >> (btw, hardware speaking, the power controller is child of a system con=
troller:
> >> there are two system controllers - "scpsystem" is for "compute part", =
and the
> >> "hfrpsystem" is for the "multimedia part" of the soc).
> >>
> >>   _______________________________________
> >> |                                       |
> >> | SYSTEM CONTROLLER (SCPSYS or HFRPSYS) |
> >> |   _____________________               |
> >> |  |                     |              | <=3D=3D=3D> Clock Controller=
s (more than one)
> >> |  | Power Controller    |     SOME     |       (provide subsystem clo=
cks for iso
> >> |  |                     |    OTHER     |        during power domain e=
nablement
> >> |  |     ______________  |   BLOCKS     |        even if a PD is voted=
)
> >> |  |    |              | |              |       non-subsystem clocks a=
re voted,
> >> |  |    | HW Voter MCU | |              |       but subsystem ones are=
 not voted
> >> |  |    |______________| |              |
> >> |  |_____________________|              | =3D=3D=3D> Rest of the SoC
> >> |_______________________________________|
> >>
> >>
> >> Hence I'm asking you - does your idea still stand?
> >>
> >> Because after this, sorry for that - this doesn't want to be an attack=
 - but
> >> I'm starting to have doubts about an approach that doesn't involve sys=
cons.
> >>
> >> Cheers,
> >> Angelo
> >
> > Sorry for the double reply, wanted to add some more words :-)
> >
> > As a note, I also thought about doing the following:
> >
> >     /* Secondary SCPSYS block with HWV capabilities */
> >     scp1_hwv: system-controller@14500000 {
> >         compatible =3D "mediatek,mt8196-scpsys", "syscon", "simple-mfd"=
;
> >         reg =3D <0 0x14500000 0 0x3000>;
> >
> >         /* SCP Power Manager with Hardware Voter */
> >         spm_hwv: power-controller {
> >             compatible =3D "mediatek,mt8196-hwv-scp-power-controller";
> >             #address-cells =3D <1>;
> >             #size-cells =3D <0>;
> >             #power-domain-cells =3D <1>;
> >
> >             /* SCPSYS hardware voter power domains */
> >             mm_proc_dormant: power-domain@MT8196_POWER_DOMAIN_MM_PROC_D=
ORMANT {
> >             ..... etc etc
> >             };
> >         };
> >
> >         imp_iic_wrap_north: clock-controller@13c30000 {
> >             compatible =3D "mediatek,mt8196-imp-iic-wrap-n", "syscon";
> >             reg =3D <0 0x13c30000 0 0x1000>;
> >             #clock-cells =3D <1>;
> >         };
> >     };
> >
> > ...but that's also not applicable, because the clock controllers are ph=
ysically
> > *not* inside of the scpsys1 block, so that would *also* misrepresent th=
e hardware
> > in the devicetree (besides still using a syscon in a way or another).
> >
> > So... I really don't see any way out of that, which really leaves me wi=
th the two
> > options that I described in the previous reply.
> >
> > Summarizing, either:
> >  - Adding hwv MMIOs (a bunch of, and each very small) to each clock con=
troller (but
> >    still all of them are poking at the same HWV controller, and I fores=
ee that this
> >    will backfire in some future iteration of the HWV hardware)
> >  - Reverting back to using the "mediatek,hardware-voter" syscon, like d=
one in
> >    https://lore.kernel.org/20250624143220.244549-10-laura.nao@collabora=
.com
> >
> > I tried really hard and thought about this for weeks (actually, started=
 even before
> > your feedback on Laura's series), but now I'm out of practical options =
that are
> > both correctly representing the hardware and not making the implementat=
ion fragile
> > (or actually more fragile than the actually broken HW implementation's =
fragility,
> > anyway).
> >
> > And besides - re-reading what I wrote after a bunch of days, the first =
option of
> > adding a bunch of hwv mmios to all of the clock controllers is, in my o=
pinion, a
> > (dirty) hack - because those mmios don't belong to the clock controller=
s, and would
> > again misrepresent the hardware in DT - especially keeping in mind the =
fact that
> > the clock controllers can be controlled with *and* (not or) without the=
 HWV (and in
> > some instances, even if using HWV, we must still write to the clock con=
trollers'
> > mmio for extra programming, as explained before).
> >
> > Every second I think about this I get more and more convinced that my w=
ay of
> > passing the SCPSYS-HWV system controller handle as a syscon is right.
> >
> > Angelo
> >
>
> I=E2=80=99ve given this some more thought over the past few days.
>
> I can't see of any other viable alternative either, other than splitting
> up the HWV MMIOs into multiple tiny reg entries across each consumer
> node as mentioned..which feels fragile and wouldn't really be an accurate
> representation of the HW, given they all ultimately target the same HWV M=
CU.
>
> All considered, modeling the HWV as a shared syscon passed to both clock
> and power controllers still seems to me like the more accurate
> representation of this specific hw layout, given both types of
> controllers interact with the same voter logic and MMIO region.
>
> Krzysztof, does the approach with scattered small reg entries per clock
> controller seem as awkward to you as it does to us? are there any other
> directions you think we should explore here?

Just to add to the argument, the hardware voter is really just an
alternative interface to the same clock or power controller; it is
not a separate controller. Trying to model it as such means you end
up with two devices fighting over control over the same hardware.

It really should be *one* clock controller with an alternative address
space. How we choose to model the hardware voter address space is up
for debate as Laura mentioned, but modeling it as another clock
controller is misrepresenting the hardware at best, and causing more
confusion for the implementation at worst.

ChenYu

