Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qLickY1e0ujLI7bpuAPKBg3ra7SxF8sIpaNTGdpk/E=; b=ONuEvNzNxgGmFS4qQ5j6JCe32a
	1qUb/0pwfZdBBpU0wzhEWOabysP4A84vqvZ1NFG/3so+QxX+CcTwCsyt9Ju1z9swUBRuZdtymyzD2
	DzRaVH/uDe7Aai5a1yGM59EAj+Z8ak4jfhS7ygDonHxHlP2i5pffxtTs/MlsBgqFixxd7lw7I0qBn
	sTE2Mdv/pwDWTwD8GKI4eKiYk4Fy4BTLt77TZXQdRSYdraeR9vEJQugjt4P1kjmXeVjrabxthhsbm
	ncGJ5Yo7SBXUJkEj951GRN3oxCdam+4xDQHZGOFpkRoCTvxikFMe9SZDwNr1GxjeEDZftrgWnxmwj
	ZpGvjD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Hj-0000000DBKa-0udP;
	Thu, 23 Jan 2025 19:54:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Cm-0000000DAaq-0nDv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:49:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso16981825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737661771; x=1738266571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/qLickY1e0ujLI7bpuAPKBg3ra7SxF8sIpaNTGdpk/E=;
        b=T0mwGEzleY34EfQBzL6YrVqhq7ziJJ2T4qbs+9+23B3zL6owhug5G3yYFWIgpZMIrX
         DS1s+oqHAywZwa7AXYxzn3Asn1iCkiQXLWWnnbTBtSqhI9po9+05+NHOv5DzH1W12zAf
         b7+9QlhY1e/DC25y4ZD318yx6kxhaaKRyKFPnxt1DUfF0allzR70fmLfBIF/8c3YAH34
         78zrRsUQOV8ddjWV3h75REDO+2qpJIM3fEHRfrX2sIIXd+VBLxmZFDDnF/MBE9XyvfNy
         aVFKTIixByQxbOb9BE4rT8LyO7sZnHQ1atShpJgtDCrjJa8DHKe/Wwon56hCXKoGVftw
         3HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737661771; x=1738266571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qLickY1e0ujLI7bpuAPKBg3ra7SxF8sIpaNTGdpk/E=;
        b=bcs1a5kkRczbXW5qCvd0yX18V3Z6eZQfXX90N3OaePvVTIoMLgA5+aTpPx2+PG9a8i
         IUD/j/IrN+0v65jGaWyvuLemjxr5/WiL+IstiuD/17sJV6R/o4U6Z1beedUhUI2W2r03
         OCN7jh0AP8HhVdmE4UeybQwxvBy8ojNFAh+Mfcv/UopiXQZqCiBYLaz9xjEYWtsDvNz8
         Ly39RlDzUl0Z9EOPbxmY63nVcDqpy7lOHrpAeJBiQsOhtdicP+tKFC0llVRTY+65fo5I
         mHprmieVQz6Z9gBtY5gfjlg28GkwTild0/hy4BIrjf8vwJ2dkbjP604v709RIz0evE4J
         hdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+04A9TvViTKDjfNyBz2ZIvAGp7UgqCT7dXYjhK6dTpXi9RKyp8CBDDtvJQjDiZGPtHtQCGPBsn0R73m2dehp@lists.infradead.org
X-Gm-Message-State: AOJu0YwH2riTS7xbV5uolMD+o30A2WvTz9OTwPINg+i2zn4WG30OO7S7
	8f57pM8YGkfFRe2DOxumUZraouOJtSIE5D7XAB8/gjhM890Ga3o=
X-Gm-Gg: ASbGnctS9IpzRu5jYtLGxnaaQA05ZKgwQ6wJ4bcgrSnEJA5ymDBR3MFDOij8BBD+EzB
	QL/mo2KdlD6/tDRhhrjfrxO3WsyFR9kODDGVI4cO7/o6gZdf5tY9YL+GjrYvzuAfuzmSSZXzKfd
	1wn3T+xypK2LmNfDGgJfcZyM8r7Ddq0hBWNbE7NEo1XvlhuTIrJC7897th14aPJtIum9qu5mdJi
	OT4Da78HrV/KqTe1+Rcn1qLwdfL2za6u9ewi3kyyOrOutNcIBun5RWabpYSLRtFgpklc0CPvAVp
	eaOj
X-Google-Smtp-Source: AGHT+IESeNKwX2zcipFaXoMlvYsxaD0Oto3RCfSnVHPTxJyo13u3XHbde1U83PRnjPUOPMjYL0fFMw==
X-Received: by 2002:a17:903:988:b0:216:7ee9:220b with SMTP id d9443c01a7336-21c35530048mr461405425ad.22.1737661771206;
        Thu, 23 Jan 2025 11:49:31 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141436sm2728275ad.134.2025.01.23.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:49:30 -0800 (PST)
Date: Thu, 23 Jan 2025 11:49:30 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>,
	"Bouska, Zdenek" <zdenek.bouska@siemens.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	"Karlsson, Magnus" <magnus.karlsson@intel.com>,
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Damato, Joe" <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>
Subject: Re: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
Message-ID: <Z5KdSlzmyCKUyXTn@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114932_226628_E68199B7 
X-CRM114-Status: GOOD (  27.34  )
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

On 01/23, Florian Bezdeka wrote:
> Hi all,
> 
> On Thu, 2025-01-23 at 16:41 +0000, Song, Yoong Siang wrote:
> > On Thursday, January 23, 2025 11:40 PM, Bouska, Zdenek <zdenek.bouska@siemens.com> wrote:
> > > 
> > > Hi Siang,
> > > 
> > > I tested this patch series on 6.13 with Intel I226-LM (rev 04).
> > > 
> > > I also applied patch "selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata" [1]
> > > and "selftests/bpf: Enable Tx hwtstamp in xdp_hw_metadata" [2] so that TX timestamps
> > > work.
> > > 
> > > HW RX-timestamp was small (0.5956 instead of 1737373125.5956):
> > > 
> > > HW RX-time:   595572448 (sec:0.5956) delta to User RX-time sec:1737373124.9873 (1737373124987318.750 usec)
> > > XDP RX-time:   1737373125582798388 (sec:1737373125.5828) delta to User RX-time sec:0.0001 (92.733 usec)
> > > 
> > > Igc's raw HW RX-timestamp in front of frame data was overwritten by BPF program on
> > > line 90 in tools/testing/selftests/bpf: meta->hint_valid = 0;
> > > 
> > > "HW timestamp has been copied into local variable" comment is outdated on
> > > line 2813 in drivers/net/ethernet/intel/igc/igc_main.c after
> > > commit 069b142f5819 igc: Add support for PTP .getcyclesx64() [3].
> > > 
> > > Workaround is to add unused data to xdp_meta struct:
> > > 
> > > --- a/tools/testing/selftests/bpf/xdp_metadata.h
> > > +++ b/tools/testing/selftests/bpf/xdp_metadata.h
> > > @@ -49,4 +49,5 @@ struct xdp_meta {
> > >                __s32 rx_vlan_tag_err;
> > >        };
> > >        enum xdp_meta_field hint_valid;
> > > +       __u8 avoid_IGC_TS_HDR_LEN[16];
> > > };
> > > 
> > 
> > Hi Zdenek Bouska, 
> > 
> > Thanks for your help on testing this patch set.
> > You are right, there is some issue with the Rx hw timestamp,
> > I will submit the bug fix patch when the solution is finalized,
> > but the fix will not be part of this launch time patch set.
> > Until then, you can continue to use your WA.
> 
> I think there is no simple fix for that. That needs some discussion
> around the "expectations" to the headroom / meta data area in front of
> the actual packet data.

By 'simple' you mean without some new UAPI to signal the size of that
'reserved area' by the driver? I don't see any other easy way out as well :-/

