Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364F0CFA768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=; b=FCeaQGrFDddoFIy4F/IAs56zTY
	qW5vfCSFoIz/6ueSQ1Yjvo7HC860C0dRDFo8ixt4dA+d0OJ0lATQeJMb5NAL9Fc8J+FACps/C4MdQ
	2KWry1AmKu6RkItOnJzWVyEG6ZhUxy3aDSXLGh29AdkaTe1GFnapV9sn9jROr4DH3ann6n9w1/H0V
	QpS7VfyXZJhFI/9zbE70HIkOTxmNzGXvPowVoeHSEErt8uaw31u/1111zbjEv+PdhjDI3/R6Cwvqe
	cdP0D4/HtSqHDOUmzv/sq5vPx5gU0OOsVcKEoTwRgxqXBmt+Od1ULFlZsRnZHd77zdRBQwBMWz31v
	uEpVAYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUDv-00000008k3C-3uYj;
	Fri, 21 Nov 2025 16:43:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUDt-00000008k2i-0B7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:43:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCl8AA2831865
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=09MGYUy+aC++hYJhkqJKDpJA
	umAjMYKueV5atsqaQBA=; b=GJPRmsC7oO6yeYSQvm7n0aJ3wi2LduGMR3Xp2Yu1
	NndVPVzJCC3UFEdIUAhSl7YLwDCvTqKfBoSTvNkaVzUbs5qpMP7lx45947nZdGEt
	JGIkq0dVfU1M4V7OdpStEeJLcsiNZ2VSsa8VtrENVqXFS3zGK74cV56R+qqDXSVd
	O7fauNnnl4dhsEuymX91j6iu+8HXhvKkDpoAPu0Y8G9XFmzQ1EZ1bQa/+3fAKQRi
	CXFDLlz3QNZbO0LWgSu+ti9GLXuj3Fa79qEYqziV75at350GsQq9jUyFThJ/qELh
	ecd+NRnUqgtyQfooUUxCgPOdjEGbkmpPufQd+KogOvSFHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq26ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24a25cff5so632064285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763743379; x=1764348179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
        b=Wys1kdOyv8nV0gH2m/gPG1IIIK379C8S9tkLtwUueaLPIJPmlHaxNEHQ7aJJ5eZ07B
         1MyR7BSddadriHSyDmWmG2cyDhnc3TiMmAlUFUHk/wYNe22K1Y503EtZfjKFHyf3/ciq
         AqiZF9Gnmlr7+Y0Xlw/AjIa9ru+BCVxJ3t0N/v2zZCqCXw7UESTJzKaDIc8h/wejtT1g
         NYIeRBC69GSYjCQisxMi7p/95USQky0ABvpjz9dB6xIIblJRFBp21Vw6OFrafjmSq0uF
         F57XzAB/2FjCJhe++5RmEwLXABy31NvW9MbtqDlW1SczykMxEDOn6W7beP7pxzJfxE+A
         879g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743379; x=1764348179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09MGYUy+aC++hYJhkqJKDpJAumAjMYKueV5atsqaQBA=;
        b=mmtSXoqjmWfxabjqOZV8L1w8SJXGyzoiuVd690E0CBf0qq84G8+Mg5KaTDdj91CVk/
         Bd+WALoViMLD7aLPKzD6MS/pBzLAZatT6OKwvtyi0cgCIQxL8VgNZcChpsPtsPlysgZe
         agwynL7b+szAytLoi8h7lDYdCoO8pXvBQR8lC0zbotM0lz5h4MwRV/trSZk9i3EQFWbx
         bEWEb1OZpMbwUioke4YjP4nU6NBg66Za2KmuEu39999Jr0lUTEmLEGaW4uvS+r44t87l
         eMVfrTGHiEo1cWyvjpBV/hURV7LXBbwXafpWPh/NtEXeDl3ntTwCtfNi6tdkYiGxXa+n
         9FRw==
X-Forwarded-Encrypted: i=1; AJvYcCXrctKgZ6Yyyo7tTkc+XiO89Tr+p/JhmxysIbhkHqMrL1in2uWzRehKLcjcPdxHhNJur3n4BIp059DsV27RoQrE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi7RvdPg2LP202FHJKWw6oNkVgKdNuawLTmVFJqnbzJFM3wh2s
	3gVPNZg5AEYJ/TpxVGmn2X4S9jU7xt7RzPDwi6YWNEPMu0glDCAtBc/281VaypReGPkSiBluv64
	1zqyuEd9tmvZFnCLei2sx3GHO12kLGSVpwy7JoKjRqEhtO/PNLR6a8YfZy+SMhWX7esHGDSp72i
	rVEA==
X-Gm-Gg: ASbGnctbC7cUOLEails1SZzC7CsQentvDEndItFP2sp0qWwwZdt3bVD4tbLPxy8nQ2q
	H3UgfW6IvQR8P2Cw6yuE45wLR776dyoLg27aJACSKPBFzg06vzgvGNDkoWtjUqThJems2jd9/B6
	spJHXR4Ix1GHHX3TyF+OsRxzrXkZZGJ+8MEeiETA9VHurtGbyYnz+xvWmWYISUQMUYndXLeZ0zA
	tloEzQklpSpLantBQcyvwetY++LDX+5j0/NR98lnNItEONCbCRBWGYkLoqjWX5k9WdWEs5rZmfS
	cAEXdn6HyLbNRDZ74l6EeV2MUhdFRvnbqPMq7uxt9dl6hiaObtKelsL8iF2L+fPkdpxEpQTKF7o
	EwllCkqwmp6XlNFrI220aIE6r0pKAD1geAU4YnNfwpWDvYkptFj/0KGbPziMXpvdUsT38sC0zar
	SbZOrOzKzno98NifwJ9xGyKuQ=
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id af79cd13be357-8b33d2639acmr332537385a.27.1763743379178;
        Fri, 21 Nov 2025 08:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIkTPz5TB8xN3lLtop+PT42zQtIBGl03bkK0iuHS9jXAS96lGvlh3BNb2mfJskgsh+6Sec3w==
X-Received: by 2002:a05:620a:4494:b0:8a3:fa43:321b with SMTP id af79cd13be357-8b33d2639acmr332533485a.27.1763743378634;
        Fri, 21 Nov 2025 08:42:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db74711sm1761230e87.12.2025.11.21.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:42:57 -0800 (PST)
Date: Fri, 21 Nov 2025 18:42:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
X-Proofpoint-GUID: 4wWY23cu4lpCUaf5lxcgYw1EJl9V7DEj
X-Proofpoint-ORIG-GUID: 4wWY23cu4lpCUaf5lxcgYw1EJl9V7DEj
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=69209694 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=WPgZoJjWRBIEHdDhQE0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfX7KiyTyu+evBf
 3pcOtHGy3bX5EbkEq0Wl3kwLMXOSWhntptanJn8es4Zgad1HQ1UCoQA3XQCs+ClCjRIa2uzv8HL
 2q322qhBIWzYL1WdlAsBiCU2v/U9ptfVGHD9f+a6c88ydQ9qdFB5QGMtW5pQ7UNKCgZHKOu3MwM
 cYuvdPerjoRdGGAQ6mGP0k0CytedL9H86Qq7PEeRQEB27QyxBQFelyYCWtMDuF/TytGjlrlEKLB
 H8rUuAJlskV6dN3jwBD8Tn5ZmOLUHFl7u4yzMVgMrx/2eRYDrUiYMJhWaNX9xJReZ8UgOUWPsM7
 No+A2GH7/hJj9xKlEn55w3aUZn1RyDzz5nxFeZg7w6fDhqoOVrfkEYRSh0Q7mhgk+LaIladJKf9
 7/a49lBkGf76c2IwoJ9S5yNZMrZlqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084301_107502_B8DB0562 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, Nov 20, 2025 at 02:25:01PM +0530, Mani Chandana Kuntumalla wrote:
> 
> 
> On 10/8/2025 6:10 PM, Konrad Dybcio wrote:
> > On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > > with their corresponding PHYs.
> > > 
> > > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +			mdss1_dp0: displayport-controller@22154000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x22154000 0x0 0x104>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22154200 0x0 0x0c0>,
> > 
> > sz = 0x200
> > 
> > > +				      <0x0 0x22155000 0x0 0x770>,
> > 
> > sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> > > +				      <0x0 0x22157000 0x0 0x09c>,
> > > +				      <0x0 0x22158000 0x0 0x09c>,
> > > +				      <0x0 0x22159000 0x0 0x09c>,
> > 
> > sz = 0x400 for all 0x9c
> > 
> > > +				      <0x0 0x2215a000 0x0 0x23c>,
> > > +				      <0x0 0x2215b000 0x0 0x23c>;
> > 
> > 0x23c -> 0x600
> > 
> > [...]
> > 
> > 
> > > +			mdss1_dp1: displayport-controller@2215c000 {
> > > +				compatible = "qcom,sa8775p-dp";
> > > +
> > > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > > +				      <0x0 0x2215d000 0x0 0x770>,
> > > +				      <0x0 0x2215e000 0x0 0x09c>,
> > > +				      <0x0 0x2215f000 0x0 0x09c>,
> > > +				      <0x0 0x22160000 0x0 0x09c>,
> > > +				      <0x0 0x22161000 0x0 0x09c>,
> > > +				      <0x0 0x22162000 0x0 0x23c>,
> > > +				      <0x0 0x22163000 0x0 0x23c>;
> > 
> > 0x2216_2000 and _3000 don't exist, there's no MST2/3
> > 
> > sizes should be changed similarly
> 
> MST2/3 is supported for MDSS1 DPTX0.

This is MDSS1 DPTX1

-- 
With best wishes
Dmitry

