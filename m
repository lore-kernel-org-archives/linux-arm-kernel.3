Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAC7CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 01:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmdLF4KW1eFiICY+4ZeOl5FJqXEjQMPENqtFLrW0CqU=; b=wVELHUfyWLRA+4Qx5mGsZ7A+sv
	VUkAlM1ucW2HXU/hYDSjleiN3KY0xVsQUZyBXlDs+QOkSPYkuDUNly35I3UPEwDCTaUyFg3QZu8nO
	jxSGIOVUADqntkSHBZop4v3N3NLO7hs1GfmE0vSUVedPt9s7lEjIzGTfnrAbTwgYYYQVett5QF+va
	9KCq1tvnsd7M636MsC9n8N58ABTjypJBcUnjudE5DcGGhbCOaY68Tmd0n+ZreNx8ik9LThJzbbWTd
	Hi3AzI6CuSovoYajCfBcLqk/IYp6rT9D4zBNTnqnLrZ1FIpAocYqy7Q2mMQe7ciDQKKXYTJHUDgOb
	IXm8mdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB8A-000000095R1-0NtQ;
	Tue, 19 Aug 2025 01:27:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB59-000000094rt-2LJz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 01:24:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0egsr008371
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dmdLF4KW1eFiICY+4ZeOl5FJ
	qXEjQMPENqtFLrW0CqU=; b=btW3Q6GoCg5RsaGSRldv98B0HsbjVBVTgfsPp9lO
	atXtSb7ME1pwAmfsFHA392o3miHbw/orstXDeEUvPL9wc3pEWqBocgA8Mu7wn3/M
	6dQ4mcwann4i6W801aROI6foxVnltb3pbEuLjijVr410ukaKAaWeHaOoCbshORU3
	n2uy+Jzu2itm5ziGYc6UkdTA3yUOlD11KakeSt2XqfbVrZ2WgCY4AxnZ+eCz4Li7
	M6mL+SZZi6crjOBaNGlau2WOtV5HD21MzhTa4zUjQRgiZTQM1qBsdprwuim46jfy
	BBbT3RXbcVarW0Np7O/hj5EOlFjD0UAZa56SHnNMbBCdww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj746qx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:24:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9289280dso103995176d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 18:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755566650; x=1756171450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmdLF4KW1eFiICY+4ZeOl5FJqXEjQMPENqtFLrW0CqU=;
        b=S1UZdR6eGI7AzpRY8EyJqv8sr/b+3hmCdtKMiD+j3qXwl4VXafaFOBrNZJtliMy+yJ
         lcZ7mzNWwW5m8CfuPR1LGI1CTC9ZBrQWZGR7xmYqLeTCzy49XuFLQdsIC0L9hSAKOShr
         VsDVBsqsbk8VNoBUsK2/4pRJMrlMdOMNdSPQAj/B21u6hcJ9ooyiftpb5Nm0nqAgwLJx
         lrvIzKTgkV/t2a+resycnhF6ewE8XTpf8aOtXIWRkDdcQUMRhpLdXhJj2jxZaOsmAdwg
         wQqjsAaitYl3+lThAYe8XeKTal7B2e0iQ9Vu+KFfc2MmNgym8r5yDW0h6iK96bQtUZfv
         efAg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Z58vmOwd+LYuvaP38oILcYfspheEtnjbVPNVusD0/6d4DdMQyGqWYs2VkmeX43UPbg0Yu9o0sJ77/QWI7dDe@lists.infradead.org
X-Gm-Message-State: AOJu0YzO8x5Rvc1yQ9wPeJ632vrTBSCvd0ljk7QCi4TlB3FxuWBlCbzT
	DYgCKtXruWOUtk8rkTFwqLpexXjW0y7O4tOWBIVNlYtplq5c1Mrmzg8NHv5aeIVHEQ/WX0Xqsgd
	nHDr5swQR6rlvSXGK+cByRo3thnX2FKU8Lf8KARvu9g8E2gpYdXnnDukaxXTkNYxL0ZendrljOW
	Q+xQ==
X-Gm-Gg: ASbGnctmUzSLXSZ7/jVYLmy3x+SHdexJ72u2Ddy6lJ7CZGRq+Ha600a4e5bcpo45Kr/
	aoRUe4ugG0lw14Ls4AIEAgzauk3JPwXxqydU07+uER159tZVpAmwpvzq7539ZLLLBsEbZ7JchJj
	ohNbqc1cZU5187ca20WeOzfk+AXMGRZDov3xkIqQE3xX7cNwirqBmXtIB2xlFKaHkpOdA8WW4f1
	PN+mE4NCFSokY3xSeSjAqtr8/c58OccrVj9wxXmi8KSFIP6m4LhbfbJwUCHdBL7mgkf5aj4YLio
	Ci/byBgc/5NQKdmW4+URAVYR6208dNEtBdhTZKzKVwfsJzTXQYpKSOZuwO2YI0CnvLNQkDp1IaP
	U2y8PeMXGKQISBv9HG6jmDWTcIOwn60hRNsVfDotPquf6SEHVDdpH
X-Received: by 2002:ad4:5c88:0:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70c35b748d0mr9519566d6.16.1755566649674;
        Mon, 18 Aug 2025 18:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGMoeyP+XpKHjrRDIijE6EvbuuoJlGOgnOnsy2Ba3WttV2NVri7TEuVqrOX54DMtuIZmLoDQ==
X-Received: by 2002:ad4:5c88:0:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70c35b748d0mr9519306d6.16.1755566649212;
        Mon, 18 Aug 2025 18:24:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351579sm1871216e87.4.2025.08.18.18.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:24:08 -0700 (PDT)
Date: Tue, 19 Aug 2025 04:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, s-jain1@ti.com, devarsht@ti.com,
        u-kumar1@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818154746.1373656-2-h-shenoy@ti.com>
X-Proofpoint-GUID: G67_O0hgtNd7IQm2rSHe23wUHFXuMzid
X-Proofpoint-ORIG-GUID: G67_O0hgtNd7IQm2rSHe23wUHFXuMzid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX3WU71N824uTv
 MNO9HIlXHk/Z3v1YXU6x57rlWCmlOZSrr9vIyfmhmH9PFUaAnILZKA1VmXB3OC8sUkqV8E2/iKO
 rE3tmgPyaNYlyHP9ZtDsFZETXfs4Z16xv50c+LiWi/zNuc5ir2rcRaLJAxCkMkK0APidhBkdVTD
 gcfixQtsILgN7qFWlp3dl1RKepui0V2xGYbtef4XSmPADxYrvTMw9LM5miIzbhMypbxJW6RSHcK
 vt33T9RSWMUJxrG6R+jhmActjNINYeAK5+qYOsawtbDs5gNYstKa2OsmrTpzrRBMYMenYpyYk13
 p+oh4s6qRD56IuPbt15CVhJFrZmMn47rjB/XFlpoacgH6hPp2zW7AopKJmRtf5E3crVZqSSO0Ap
 LMQJafqO
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a3d23b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=RF00TdSWAAAA:8 a=sozttTNsAAAA:8 a=YApXqb8GNPtt5Rl-DmUA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_182411_599850_9E85538D 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
> Add RPi DSI panel[0] as a valid compatible for simple-panel.
> 
> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1ac1f0219079..65f486f2bc9d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -268,6 +268,8 @@ properties:
>        - rocktech,rk070er9427
>          # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>        - rocktech,rk043fn48h
> +        # Raspberry, 7" dsi panel
> +      - rpi,7inch-dsi

It's powertip,ph800480t013-idf02

>          # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>        - samsung,ltl101al01
>          # Samsung Electronics 10.1" WSVGA TFT LCD panel
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

