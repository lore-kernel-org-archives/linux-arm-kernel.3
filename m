Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC56C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/PkgtLgVvWcu51PwggaDBW3nYz9YJK7T0osJyvwq7Q=; b=O0cGU9ArWqbKbFbNk4z4ApL/uQ
	Tg66jKFP6jRZyf/rnbxjq64v8dlVqazEsyNusXtF9+IoPQdCuDC9DlbJZlRW6CY6Ffti8a1iwOtt8
	LXaTgzjwkG5VQONBqlJh91nPeqaGJR1S+gTjXVFxP8aHucOEgVOVVp5ZQL3sH8IqIbPO1/kKt1S3T
	LILqcxex1TyvvmV0awcjQI/uIycEdCYAyn5mMeiX2K7kwyTzt8zDh/hemf3TaoP3WF65gfzE+mURQ
	DsWKgiVDIqbj/9xIbJhZ93T8u3uOjmipNqHf/0jAOSdUMSG5vxTQnr3+YIUFZPo2YqbEb6QNorhA9
	pYd1Lbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixM8-0000000FG76-0NAk;
	Fri, 14 Feb 2025 15:11:52 +0000
Received: from relay.uni-heidelberg.de ([129.206.100.212])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixGR-0000000FF67-0HAW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uni-heidelberg.de; i=@uni-heidelberg.de; q=dns/txt;
  s=s1; t=1739545560; x=1771081560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9nkcpXZNvkPRt/uuH/9BO1mdsXmqDK8fyg9SPqOXcyE=;
  b=jfukxvyqMf6geCjN0jWaiFd/1Yp9i9IFhCXO24K7OYLMdX+q4YtkZ47c
   AjOwf+tpoLirPCPicCyswvBStcQYKRvCgjp4cwLamw7DORS1iwgehd+CM
   gyp2kZo9odCVD774aMr8PmC7A5P/FnLZVJUV/NLZOjVMwRrT+BhCqskeB
   52aCGknzjTdNEK99uMF9rLbkZH3mJR9K5fUYGSinHnNPupLbSqM8nay/o
   Hlr2wxabYbK4ueL65w+QwQ3OIcCZgumobVKY5trHHbKXZjcSmuVKxCZJL
   A/N9wrNddkZZ8pifNlv9ea5m0S9g+41EWMop5egVh1Dd3/GVfHCQED4Ea
   Q==;
X-CSE-ConnectionGUID: qf2ZENTEQwuWng8L42772g==
X-CSE-MsgGUID: 6y0cHPHCQeq7UrFSk0mm9w==
X-IPAS-Result: =?us-ascii?q?A2AOAwDYWq9n/1BqzoFaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?VODJgGGU5FwA6AhAQEBAQEBAQEBCUQEAQGFB4sMKDgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQEBDgEBBgEBAQEBBwWBIYYIhlsBBSNWEAsYAgImAgIUSIV6sAqBMoEB3?=
 =?us-ascii?q?kuBNCOBGi6ITwGFa4JIhH6BFYMqPoQaAQo7gz46gi8EgnmBJINApSRSe3gsA?=
 =?us-ascii?q?VUTFwsHBYEpSAOBESOBIwU0Cjc6gg1pSToCDQI1Z4E3fIIrgiCCOIRDhE2FW?=
 =?us-ascii?q?IISgWMDAxYQgyF4HIUUZx1AAwttPTcUG6UJgUMXAi2BLgWXBrAEB55bCYcBB?=
 =?us-ascii?q?BYzl1GTAZh9qS6BfoF+Mz6DN1EZD9t2gTMCBwsBAQMJj3YBgXwBAQ?=
IronPort-Data: A9a23:mbMxi6lOUYCeJTlfMRljlM3o5gzHIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODTzVOPiNZzf3f9t/OY6yoUoB68fXyIUwQQU//ilmEFtH+JHPbTi7Bh6tYHnCcJGroGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48D8kk/vOHuGgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArlV
 ena+6UzA3f7nWcvWo4ow/jb8k435q2u4G5wUmEWPJingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID66vR2nRHe545gXBYqhee7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSq9ZefSUVTv/B/wGXffSHe7tNSIXgpILIe9bZTXTsRq
 qYXfWVlghCr34pawZq/R+xrgIIiM9OtIYUe/3FtzD3UCfwrW5+FT6iiCd1whW1hwJoWQ7CHP
 5RfOWIHgBfoOnWjPn8XDJsjkf2AgnT6dDseqU2P47cx4i3TwQ193bznPcDaPNCHLSlQthzE/
 DOboTulW3n2MvTB2GKO0kqMrdbChHzGQqwpF+W986911Qj7Kms7UkRNBAbg/5FVkHWWRN9ZM
 GQf4Ssj668o+ySDU8bgdxyzrXiDoQ9aXtc4O+Q85BuAjLLO8ReGD3INZjdbbZots8pebSYt3
 F+hnN7zAzFr9rqPRhq19a2GrnC+JQAWIHUEaCtCShEKi/Hop4c0lFHDUv5gHbSzg9mzHiv/q
 xiIoTI4irdVls0R3q+29njIhjutot7CSQtdzh7eW3+o6itiZImhY4Wu5R7c9/koBIKYSESR+
 XEeno2d4foIAJWlkC2WXP5LHben/f+JPTTQx1l1EPEJ8zWr5m7mZp1W8DBWIEZyLt1CfT7vf
 V+VtQ5PjLdfMWWrZqJreY+8I9olwLKmFtn/UP3QKN1UbfBZcA6B4TErZkOK2W3puFYjnLt5O
 pqBd8uoS3EABsxaICGeQ+oY1rltxz8kg37VRNX7whWr3L6UaWSaD7sIWLeTUgwnxLqK+jf41
 epyDtSX9BNQAMmiOHaIq4FGeDjmMkMH6YDKR91/L7HYc1c9RD96UJfsLaUdl5tNs4k9qwspw
 p1echYGoLYHrSebQThmk1g6AF4vNL4mxZ7BAQQiPEyzx18oapu14aEUevMfJOZ8pbA8lKIlF
 KJeJK1s58ijrByaolzxirGg9+RfmOiD2GpiwgL8O2FkJc4Iq/LhpY+5LmMDCxXi/gLt7JBv/
 ub+vu8qaYcFRhpvFt3XdPui0xuxsHkRleZ4UlHHSuS/i22ymLWH6kXZ0JcKHi37AUman2vFj
 VbIXUZwSCuki9ZdzeQlTJus9++Be9aS1GIHd4UHxd5a7RXnw1c=
IronPort-HdrOrdr: A9a23:BCeVo6tmX+OSuWUaDJ1ZS+iM7skCpIMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhAo6HnBEDkex/hHPFOkO0s1NuZLWvbUQiTXeJfBOnZskTd8kTFn4Yzu8
 ddmsBFeaXN5DNB/KHHCWeDYrMdKe28gduVbKrlvgRQZDAvT5slwxZyCw6dHEEzbA5aBaAhHJ
 7ZwsZcvTKvdVkec8z+XxA+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAuQ3k4aeIte2913bnph3uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkYLGGtCBdmpDQ1L5/+u
 Osnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoF8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KQuZkRkIMYjgYJq3MUiFQJuYeE99RvBmfca+T
 xVfYnhDPU/SyLkU5mWhBgi/DWWZAVOIv63eDl+hiWr6UktoJlY9Tpo+CVNpAZxyHt6cegx29
 j5
X-Talos-CUID: 9a23:y7yfGm+pvKjk8U0wVKiVv1caQPIIVEHw9WjNHEm3WUI1EuLKE1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AYlcmgg7YdI4OIAOfdVbdWPa4xow28vylKHgtuqw?=
 =?us-ascii?q?Lopa5LwJLOG+YiWWoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from lemon.iwr.uni-heidelberg.de ([129.206.106.80])
  by relay.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 16:05:46 +0100
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
	(envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
	id 1tixGB-0002Z2-Iz; Fri, 14 Feb 2025 16:05:43 +0100
Date: Fri, 14 Feb 2025 16:05:43 +0100
From: Hermann.Lauer@uni-heidelberg.de
To: Chen-Yu Tsai <wens@csie.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO
 regulator
Message-ID: <20250214150543.GA9779@lemon.iwr.uni-heidelberg.de>
References: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
 <20241214011612.4fd9e4bf@minigeek.lan>
 <e61c927a4dfe909f4ede4a07dffd9dcd762875be.camel@icenowy.me>
 <20241220172134.GA9899@lemon.iwr.uni-heidelberg.de>
 <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070559_678938_614864B6 
X-CRM114-Status: GOOD (  24.32  )
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

On Mon, Dec 23, 2024 at 01:18:18AM +0800, Chen-Yu Tsai wrote:
> > > > CC:ing Icenowy, who added the regulator originally, with commit
> > > > 0ca12c1ee43c ("ARM: sun8i: r40: add 5V regulator for Banana Pi M2
> > > > Ultra").
> > ...
> > > > Icenowy: can you clarify what "newer" version this was referring to
> > > > in
> > > > that commit message? That commit in itself doesn't seem to do
> > > > anything,
> > > > as the regulator isn't referenced, and it's not always-on. It's only
> > > > later when the USB nodes were added that it got used?
> > > > So was PH23 really necessary?
...
> > diagnosed that futher now: PH23 is indeed powering the USB-Ports. Whats
> > happens ist that I powered the board through the micro USB port which turned
> > out to be limited to 900mA in axp221s. So the setting of reg 0x30 is
> > the real culprit: Setting the two lowest bits in this register allows
> > unlimited power over micro usb.
...
> > > I am not sure, the schematics I have here (which says V1.0) have PH23
> > > as NC... Well, the M2 Berry schematics have PH23 as 5V EN, maybe I
> > > messed up M2U and M2B when developing?
> >
> > While V1.0 didn't need the PH23 setup due to nc, V1.1 needs it. Maybe V1.1
> > was already on the horizon...
> 
> It seems this patch isn't needed then?

It's plain wrong: The culprit is the power issue as discussed above. Strange
is the increase of power needed on V1.1, as V1.0 is working with the limit
in place.

As there are issues with the stability of the mmc driver even when disabling
mmc2 and mmc3, maybe something yet to be found changed in the mmc wirering
on V1.1 bords which increases power consumption compared to V1.0 with the
actual driver.

Sorry for the late reply - my time to look at this is scarse.
Thanks (especially to Andre for his help) and greetings
 Hermann

