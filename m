Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39195C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 05:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g54+s9aZuGswPXEDEk5jdyNkLdOH4muLufHQ2pgK3U=; b=SlICVR6zMGiuX2gHw2GfPv/6aL
	Dd5F24KTY85QZk97QiGu7AiCOY22JFsAvuzo3Ci2MtK6J8RSYIoa9Us4UpECihrdaQnZzqUb7K2AK
	BdFp0DyIVf52+1FldZlgjjRVhtP76cTP2k8FYemV0Z35louMwXTUChjRWCgB0/ccF0tCd+g714shA
	n+y0fHIKfkXddyfmSBg+eNqfleODgkqSuF2lU6JrjWBq+tVllZ/Xa7djC06LOMJUjE0scCRuD7IIS
	kzEdhEGUdm7e50I9NpVvfoYwVlVPVdX6qGQlIHi9HYBfuqpL3jpUPAMn4vgK6nJAO32oYmuBQiuT2
	FaIybptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9d8C-00000008M1s-3E8w;
	Tue, 29 Apr 2025 05:03:44 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9d5e-00000008LTa-2bYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 05:01:07 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c559b3eb0bso331098985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745902865; x=1746507665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g54+s9aZuGswPXEDEk5jdyNkLdOH4muLufHQ2pgK3U=;
        b=VF+r/iBhCIQ8kgI6IasUgOBCmIdwhgjotDnis+2KPWYla1OCZCJXOoigJK2gwj0byY
         8aLDq2IOuzreH0o7n4AOMTXfkAtIogcrdeI5sKtKYXWYWEcRuR9otPIAlNUtRGrdqDmC
         8j6D0DTVVFiEmxtu/miL29YYQlhVEzlC9FIhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902865; x=1746507665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g54+s9aZuGswPXEDEk5jdyNkLdOH4muLufHQ2pgK3U=;
        b=mcv7Pgr8obcjmNPYcpCqRJ9+vw4NNZykYFZbhRlJnQLr2FlpKTqBtxeCQqR6BNrx++
         PHICauPYPjiXoAT/WUsSa1NzEpaa+5GxoyvnZEr5VrfDE6AoB4c1HlbypBRGGujNgyR6
         hwnJoE1vBi++x0rCX15NWsctP9ICkSKvn1uYM/I+6GnQpYqpzIjD6GTffO64ZBCe7FtT
         9+7G5o+s6Upn4kL0VjluXuzPfWL9ThLvKDMQ1op37oPZ01CgbYORBCLJATrt6el6SW6X
         GtjkoiXue0v5ZUUFd9WlHhv/V1LwBrbf7J4DrT/so+aianhd3sqE/TL8i1+W4DFSW7fi
         muWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOoOwbgmjGD7AuI07np5pW41cQTlWV2KfnGkruNBzTtvAVcSGUzFtuHwdOcEn8Mx+w/bwQ7thkg5lliMEda4uR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Izw8LcFFUCBafdJCzYnf1ftvZ/fTZICgjTzWlWwYNdiJSACr
	cu+oMZKHqmjnXG9+i/tlLwH+Z0cggW851BomeXloQ3910xb/Q4s1e2jli6zAXYdaTwAhXunGnYn
	JDhI6LCvSQPW2atQf5mTvn6630N2rPo46EPtG
X-Gm-Gg: ASbGncvsaJKqV1OKjnd55CkF5M93fnwJATxZlDvx0g1jAFsBQxsWM8q2tEMrTMYlGcN
	gLXxIZUbqUXp7/FrO+16JQ9I+VvXftfgEJdeUHXJzN284oK8am5PZxuu/p46Hu2cDGeuiGFV/Kq
	SoGEdHEkN5tQyJUyz515iQTuEz09wom4TCG8o0BW5i2cZXWVuetg==
X-Google-Smtp-Source: AGHT+IH/cTIgZbTtJX+LijPUr/ABJvzBkHBUqPo5poUjvMA9PYLyZr9S87/2WDOWapFTxha4Uwo7L/uO7K4HxcaTHrQ=
X-Received: by 2002:a05:620a:8289:b0:7c7:b5f7:31a5 with SMTP id
 af79cd13be357-7cabddd8292mr309549485a.53.1745902865349; Mon, 28 Apr 2025
 22:01:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 22:01:04 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 22:01:04 -0700
MIME-Version: 1.0
In-Reply-To: <20250422121837.GA734359-robh@kernel.org>
References: <20250416000208.3568635-1-swboyd@chromium.org> <20250416000208.3568635-6-swboyd@chromium.org>
 <20250422121837.GA734359-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 22:01:04 -0700
X-Gm-Features: ATxdqUGHE-hg0TKzzfW0b6WqCXJ5hFex9LRGyJsjzIPGPl6nCb3NX33AuvfAxeg
Message-ID: <CAE-0n51Zk83EBv-QKjB57zKDs5RqugDzMQ1rR2Ux8=p1AVUPJw@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: usb: google,cros-ec-typec: Add ports for
 DP altmode
To: Rob Herring <robh@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Jameson Thies <jthies@google.com>, Andrei Kuchynski <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220106_669439_985F565F 
X-CRM114-Status: GOOD (  48.92  )
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

Quoting Rob Herring (2025-04-22 05:18:37)
> On Tue, Apr 15, 2025 at 05:02:05PM -0700, Stephen Boyd wrote:
> > Add a DT graph binding to google,cros-ec-typec so that it can combine
> > DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoin=
t
> > that is connected to the usb-c-connector node's SS endpoint. Allow ther=
e
> > to be multiple 'typec' nodes underneath the EC node so that one DT grap=
h
> > exists per DP bridge. The EC is actually controlling TCPCs and redriver=
s
> > that combine the DP and USB signals together so this more accurately
> > reflects the hardware design without introducing yet another DT node
> > underneath the EC for USB type-c "stuff".
> >
> > If the type-c ports are being shared between a single DP controller the=
n
> > the ports need to know about each other and determine a policy to drive
> > DP to one type-c port or the other. If the type-c ports each have their
> > own dedicated DP controller then they're able to operate independently
> > and enter/exit DP altmode independently as well. We can't connect the D=
P
> > controller's endpoint to one usb-c-connector port@1 endpoint and the US=
B
> > controller's endpoint to another usb-c-connector port@1 endpoint either
> > because the DP muxing case would have DP connected to two
> > usb-c-connector endpoints which the graph binding doesn't support.
> >
> > Therefore, one typec node is required per the capabilities of the type-=
c
> > port(s) being managed. Add a port to the DisplayPort altmode as well, s=
o
> > that we can show the connection between the DP controller and the DP
> > altmode. This lets us indicate which type-c ports the DP controller is
> > wired to. For example, if DP was connected to ports 0 and 2, while port
> > 1 was connected to another DP controller we wouldn't be able to
> > implement that without having some other DT property to indicate which
> > output ports are connected to the DP endpoint.
> >
> > Furthermore, this supports ChromeOS designs like Corsola where a DP
> > controller/PHY is split with two lanes going to one connector and the
> > other two lanes going to another connector. In this case, we wouldn't
> > have the graph binding under the cros-ec-typec node, but we would have
> > the graph binding in the DP altmode directly connected to the DP
> > controller's two output endpoints.
> >
> > Cc: Rob Herring (Arm) <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Acked-by: Lee Jones <lee@kernel.org>
> > Cc: Benson Leung <bleung@chromium.org>
> > Cc: Guenter Roeck <groeck@chromium.org>
> > Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> > Cc: <devicetree@vger.kernel.org>
> > Cc: <chrome-platform@lists.linux.dev>
> > Cc: Pin-yen Lin <treapking@chromium.org>
> > Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Cc: Jameson Thies <jthies@google.com>
> > Cc: Andrei Kuchynski <akuchynski@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  .../bindings/connector/usb-connector.yaml     |   6 +
> >  .../bindings/mfd/google,cros-ec.yaml          |   7 +-
> >  .../bindings/usb/google,cros-ec-typec.yaml    | 165 ++++++++++++++++++
> >  3 files changed, 175 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.=
yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 11e40d225b9f..e3d60997c03e 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -179,6 +179,12 @@ properties:
> >              $ref: /schemas/types.yaml#/definitions/uint32
> >              description: VDO returned by Discover Modes USB PD command=
.
> >
> > +          port:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: OF graph bindings modeling a data bus to the
> > +              DisplayPort altmode from the DisplayPort controller. Use=
d when
> > +              the altmode switch is part of the port manager.
> > +
>
> Why can't this connection be another endpoint on port@1 as that is the
> port for the SS signals.

It can be. I mentioned this in the cover letter but I understand if you
didn't read it. :)

I put it here in the displayport node because I wanted to represent that
this is the graph endpoint for displayport altmode. Otherwise, I'll have
to represent that with an endpoint in the usb-c-connector/port@1 node
that represents the SuperSpeed lanes, or do even more.

>
> >    port:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: OF graph bindings modeling a data bus to the connecto=
r, e.g.
> > diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml =
b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > index ac89696fa649..63d506e88abb 100644
> > --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > @@ -98,9 +98,6 @@ properties:
> >
> >    gpio-controller: true
> >
> > -  typec:
> > -    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> > -
> >    ec-pwm:
> >      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
> >      deprecated: true
> > @@ -163,6 +160,10 @@ patternProperties:
> >      type: object
> >      $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
> >
> > +  "^typec(-[0-9])*$":
> > +    type: object
> > +    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> > +
> >  required:
> >    - compatible
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec=
.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> > index 3272d0e01f7e..611345bbe884 100644
> > --- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> > +++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> > @@ -26,6 +26,55 @@ properties:
> >    '#size-cells':
> >      const: 0
> >
> > +  mux-gpios:
> > +    description: GPIOs indicating which way the DisplayPort mux is ste=
ered
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  no-hpd:
> > +    description: Indicates this device doesn't signal HPD for DisplayP=
ort
> > +    type: boolean
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Port for DisplayPort (DP) data
> > +
> > +        properties:
> > +          endpoint@0:
> > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > +            description: Input DP port
> > +
> > +        patternProperties:
> > +          '^endpoint@[1-8]$':
> > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > +            description: Output to the usb-c connector's DP altmode
>
> This is odd. Generally (or always?) a port is 1 direction.

I was thinking about the case where PCIe is wired here as well for
thunderbolt altmode. If all the "DP stuff" is in one port then I can
pick the port@0 and follow endpoints from there. We don't have the PCIe
case on DT systems so it probably doesn't matter. If we had that case we
would probably add another endpoint to the usb-c-connector/port@1 to
represent that connection to the PCIe phy/controller anyway because I
suspect we wouldn't be able to steer the PCIe links physically. This
also helps to represent the analog mux we have on Trogdor that steers
the DP lanes to one or the other usb-c-connector.

>
> Other bindings IIRC have 3 ports in the device doing the muxing: 1
> output for connector port@1, 1 USB SS input, and 1 DP input.
>

I'm trying to represent the altmode muxing that happens with hardware
that the EC controls (i.e. not on the AP/Linux) along with describing
the connection between the usb-c-connector and the USB/DP controllers.
Basically 2 DP lanes and 2 USB SS lanes go into a muxing chip that the
EC controls and the output of that chip is 4 lanes of USB SS lanes that
go straight to the usb-c-connector with the proper orientation for the
pin configuration. Depending on the altmode that the EC enters on the
usb-c-connector, the 2 DP lanes pass through the EC to the connector, or
they're terminated at the muxing chip. If we controlled it from the
kernel the binding would look very much like the other bindings that
have 3 ports like you mention, 1 USB SS input and 1 DP input and a
single output for the usb-c-connector/port@1.

On some ARM chromebooks (e.g. Corsola), we have a DP transmitter that
wires 2 DP lanes to one usb-c-connector and 2 DP lanes to another
usb-c-connector. The graph is sort of like

 port0: AP DSI -> IT6505 DP_ML0/1 -> EC TCPC0 -> usb-c-connector@0
 port1: AP DSI -> IT6505 DP_ML2/3 -> EC TCPC1 -> usb-c-connector@1

where IT6505 can have two outputs in the graph, for either DP_ML0/1 or
DP_ML2/3. I imagine the graph for that device looks like this:

 ports {
   port@0 { // DSI input
   };
   port@1 { // DP output
     dp_ml01: endpoint@0 { // DP_ML0/1
       data-lanes =3D <0 1>;
     };
     dp_ml23: endpoint@1 {
       data-lanes =3D <2 3>;
     };
   };
 };

and the usb-c-connector accepts the DP endpoint:

 usb-c-connector@0 {
   altmodes {
     displayport {
       ports { endpoint { remote-endpoint =3D <&dp_ml01>; }; };
     };
 };
 usb-c-connector@1 {
   altmodes {
     displayport {
       ports { endpoint { remote-endpoint =3D <&dp_ml23>; }; };
     };
 };

On other ARM chromebooks (e.g. Trogdor) we have a DP transmitter that we
steer through an EC controlled analog mux. That looks like this:

 port0: AP DP -> EC mux -> EC TCPC0 -> usb-c-connector@0
 port1: AP DP -> EC mux -> EC TCPC1 -> usb-c-connector@1

where the AP DP binding looks like a single port

 port { ap_dp: endpoint { remote-endpoint =3D <&ec_dp>; };};

and the EC binding accepts that single port as input

 ports {
   port@0 {
     ec_dp: endpoint@0 {
       remote-endpoint =3D <&ap_dp>;
     };
     ec_dp0: endpoint@1 {
       remote-endpoint =3D <&dp_c0>;
     };
     ec_dp1: endpoint@2 {
       remote-endpoint =3D <&dp_c1>;
     };
   };
 };

and finally the connector takes an output endpoint from the DP "port"
into the altmode node.

 usb-c-connector@0 {
   altmodes {
     displayport {
       ports { dp_c0: endpoint { remote-endpoint =3D <&ec_dp0>; }; };
     };
 };
 usb-c-connector@1 {
   altmodes {
     displayport {
       ports { dp_c1: endpoint { remote-endpoint =3D <&ec_dp1>; }; };
     };
 };

I was thinking of making a drm_bridge for each usb-c-connector node and
for each DP input node in the EC typec node, then hotplugging the bridge
chain from the EC typec driver when the EC indicates the usb-c-connector
is in DP altmode. When we have a chip like IT6505 that means we make two
drm_bridges in the IT6505 driver, two in the EC typec driver, and one
for each usb-c-connector node (usually two). When we steer two DP lanes
with the EC, we have two drm_bridges in the EC typec driver and one for
each usb-c-connector node. The hotplug portion of the bridge chain only
goes to the EC in the latter case while it extends up to the IT6505 chip
in the former.

If we add endpoints for each altmode into the usb-c-connector/port@1
node then it may work without adding the intermediate EC graph, but I
worry about the Trogdor case. We could number the endpoints in the
connector like this:

usb-c-connector/port@1
   endpoint@0 =3D=3D USB SS (USB3)
   endpoint@1 =3D=3D DP lanes (DisplayPort)
   endpoint@2 =3D=3D TBT links (Thunderbolt)

but the DP controller only has one output port for the 2 DP lanes on
Trogdor, so we really need the graph binding in the EC just so that we
can have two graph output ports to connect to each usb-c-connector's
SuperSpeed port without changing the DP controller's binding.

TL;DR: I'm hesitant to add another endpoint into the usb-c-connector
graph's port@1 to handle alternate modes. It doesn't reflect reality. At
the same time, it looks verbose to describe the EC controlled TCPCs and
the mux. Ugh.

Now that I've written this all (thanks for reading!) I wonder if I
should bite the bullet and describe the TCPCs the EC controls as part of
the graph binding. If we did that it may be verbose but it would reflect
reality. Similarly, we can describe the EC mux on Trogdor as a single DP
input port. Maybe a graph binding like this would work in all cases:

 ec-typec {
   ports {
     port@0 { // DP mux input (only on Trogdor)
       endpoint {};
     };
     port@1 { // TCPC0
       endpoint@0 { // DP input (empty on Trogdor?)
       };
       endpoint@1 { // USB SS input
       };
       endpoint@2 { // PCIe input
       };
     };
     port@2 { // TCPC1
       endpoint@0 { // DP input (empty on Trogdor?)
       };
       endpoint@1 { // USB SS input
       };
     };
     // output starts at 9 =3D 1 + 8 possible connectors
     port@9 { // TCPC0 output
       endpoint { }; // To usb-c-connector@0/port@1
     };
     port@10 { // TCPC1 output
       endpoint { }; // To usb-c-connector@1/port@1
     };
   };
 };

or I need to make a whole new node for the DP mux that the EC controls
because the graph is getting gnarly:

 dp-mux { // Only on Trogdor
   mux-gpios =3D <&ec 42 GPIO_ACTIVE_HIGH>>;
   ports {
     port@0 { // DP input
     };
     port@1 {
       mux_output0: endpoint { };
     };
     port@2 {
       mux_output1: endpoint { };
     };
   };
 };

 ec-typec {
   ports {
     port@0 { // TCPC0
       endpoint@0 { // DP input
         remote-endpoint =3D <&mux_output0> or <&dp_ml01>;
       };
       endpoint@1 { // USB SS input
       };
     };
     port@1 { // TCPC1
       endpoint@0 { // DP input
         remote-endpoint =3D <&mux_output1> or <&dp_ml23>;
       };
       endpoint@1 { // USB SS input
       };
     };
     port@8 { // TCPC0 output
       endpoint { }; // To usb-c-connector@0/port@1
     };
     port@9 { // TCPC1 output
       endpoint { }; // To usb-c-connector@1/port@1
     };
   };
   usb-c-connector@0 { };
   usb-c-connector@1 { };
 };

Any binding that relies on having multiple DP input endpoints in the
same ports node will require the ability to register more than one
drm_bridge for the same parent node. I haven't checked to see if that's
possible with the hotplug bridge patches. If it isn't, then we'll
possibly want to describe each TCPC as a different node as well so that
a drm_bridge can be associated with a graph node parent device.

 tcpc0 {
   ports {
     port@0 { // DP input
       endpoint {
         remote-endpoint =3D <&mux_output0> or <&dp_ml01>;
       };
     };
     port@1 { // USB SS input
       endpoint {
       };
     };
     port@2 { // USB type-c output
       endpoint { }; // To usb-c-connector@0/port@1
     };
   };
 };

 tcpc1 {
   ports {
     port@0 { // DP input
       endpoint {
         remote-endpoint =3D <&mux_output1> or <&dp_ml23>;
       };
     };
     port@1 { // USB SS input
       endpoint {
       };
     };
     port@2 { // USB type-c output
       endpoint { }; // To usb-c-connector@1/port@1
     };
   };
 };

 ec-typec {
   usb-c-connector@0 { };
   usb-c-connector@1 { };
 };

In this last example, a drm_bridge is made for each tcpc,
usb-c-connector, and mux node. Any direction you can provide? Maybe this
last one is the best approach that doesn't suffer from trying to cram
everything into the typec node.

